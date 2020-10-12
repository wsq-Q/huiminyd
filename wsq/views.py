# -*- coding: utf-8 -*-
import datetime
import operator
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.core.urlresolvers import reverse
from django.http import HttpResponse
from django.http.response import HttpResponseRedirect
from django.shortcuts import render, render_to_response
from .models import Goods, Shop, GoodsShop, GoodsRecord, GoodsAddRecord, GoodsSellRecord, InboundChannel, \
     Order, OtherCost, TransferShop, TransferRecord, ChangeCountRecord, RefundRecord
from django.db.models import F
from functools import cmp_to_key

@login_required(login_url='/wsq/login')
def all_goods(request):
    goods = Goods.objects.filter(is_delete=False).order_by('goods_name')
    datas = []
    amount = 0
    # print(goods)
    for good in goods:
        # print("good:",good)
        huimin = GoodsShop.objects.get(goods=good, shop__name='惠民药店')
        # print("huimin",huimin)
        m = {'goods': good, 'huimin': huimin}
        amount += huimin.remain
        datas.append(m)
    shang = int(len(goods) / 3)
    yu = int(len(goods) % 3)
    if yu != 0:
        shang += 1
    return render_to_response('all_goods.html',
                              {'request': request, 'data1': datas[:shang], 'data2': datas[shang:shang * 2],
                               'data3': datas[shang * 2:], 'title': '惠民药店管理系统', 'header': '惠民药店管理系统', 'amount': amount})


@login_required(login_url='/wsq/login')
def one_good(request):
    if request.method == 'GET':
        return render_to_response('check_sell.html', {'request': request, 'header': '搜索药品', 'title': '搜索药品'})
    elif request.method == 'POST':
        ydname = request.POST['yd_name']
        select = Goods.objects.filter(goods_name__icontains=ydname,is_delete=False)
        if select:
            goods_list = []
            for select0 in select:
                huimin = GoodsShop.objects.get(goods=select0, shop__name='惠民药店')
                good_dict = {'goods': select0, 'huimin': huimin}
                print(good_dict)
                goods_list.append(good_dict)
            return render_to_response('one_good.html',
                                      {'request': request, 'datas': goods_list, 'title': '惠民药店管理系统', 'header': '惠民药店管理系统'})
        else:
            return HttpResponseRedirect(reverse('no_good'))

def no_good(request):
    return render_to_response('no_good.html', {'request': request, 'title': '无此药品', 'header': '无此药品'})

def connect(request):
    return render_to_response('connect.html')

@login_required(login_url='/wsq/login')
def delete_goods(request):
    if request.method == "GET":
        goods = Goods.objects.filter(is_delete=False).order_by('goods_name')
        datas = []
        amount = 0
        for good in goods:
            huimin = GoodsShop.objects.get(goods=good, shop__name='惠民药店')
            m = {'goods': good, 'huimin': huimin}
            amount += huimin.remain
            datas.append(m)
        shang = int(len(goods) / 3)
        yu = int(len(goods) % 3)
        if yu != 0:
            shang += 1
        return render_to_response('delete_goods.html',
                                  {'request': request, 'data1': datas[:shang], 'data2': datas[shang:shang * 2],
                                   'data3': datas[shang * 2:], 'title': '删除药品', 'header': '删除药品', 'amount': amount})
    elif request.method == "POST":
        goods_id = request.POST['goods_id']
        goods = Goods.objects.get(id=goods_id)
        goods.is_delete = True
        goods.save()
        return HttpResponse("success")



@login_required(login_url='/wsq/login')
def add_goods(request):
    if request.method == 'GET':
        return render_to_response('add_goods.html', {'request': request, 'title': '添加药品', 'header': '添加药品'})
    elif request.method == 'POST':
        user = request.user
        goodsname = request.POST['goodsname']
        price = request.POST['price']
        goods = Goods(goods_name=goodsname, average_price=price, last_price=price, add_people=user)
        goods.save()
        shops = Shop.objects.all()
        for shop in shops:
            goodsshop = GoodsShop(goods=goods, shop=shop, remain=0, last_updater=user)
            goodsshop.save()
        return HttpResponseRedirect(reverse('addsuccess'))


def add_success(request):
    return render_to_response('add_success.html', {'request': request, 'title': '添加成功','header': '添加成功'})


def mylogin(request):
    if request.method == 'GET':
        logout(request)
        return render_to_response('login.html')
    elif request.method == 'POST':
        next = request.GET.get('next', '/wsq/all/goods/')
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                return HttpResponseRedirect(next)
            else:
                return HttpResponse('账号被锁定！')
        else:
            return HttpResponseRedirect(reverse('login_fail'))


def login_fail(request):
    return render_to_response('login_fail.html', {'request': request, 'title': '登录失败'})


def mylogout(request):
    logout(request)
    return HttpResponseRedirect(reverse('mylogin'))


@login_required(login_url='/wsq/login')
def api_sell(request):  # 销售
    if request.method == 'GET':
        goods_id = request.GET['goods_id']
        shop_id = request.GET['shop_id']
        action = request.GET['action']
        if action != 'sub':
            return HttpResponse('error')
        goods = Goods.objects.get(id=goods_id)
        goodsshop = GoodsShop.objects.get(goods=goods, shop=Shop.objects.get(id=shop_id))


        return render_to_response('modal_sell.html',
                                  {'request': request, 'goodsshop': goodsshop})
    elif request.method == 'POST':
        user = request.user
        if not user:
            return HttpResponse("false")


        goods_id = request.POST['goods_id']
        shop_id = request.POST['shop_id']
        number = int(request.POST['number'])
        price = float(request.POST['price'])
        customer = request.POST.get('customer', '无')
        phonenumber = request.POST.get('phonenumber', '无')
        address = request.POST.get('address', '无')
        remark = request.POST.get('remark', '无')
        goods = Goods.objects.get(id=goods_id)
        shop = Shop.objects.get(id=shop_id)

        goodsshop = GoodsShop.objects.get(goods__id=goods_id, shop__id=shop_id)
        rem = goodsshop.remain
        if number > rem:
            return HttpResponse('chaoguo')

        goods_record = GoodsRecord(goods=goods, shop=shop, change_num=(-number), updater=user)
        goods_record.save()

        goodsshop.remain -= int(number)
        goodsshop.save()

        goods_sell_record = GoodsSellRecord(goods=goods, shop=shop, sell_num=number, average_price=goods.average_price,
                                            sell_price=price, customer=customer,
                                            phonenumber=phonenumber, address=address, remark=remark,
                                            updater=user)
        goods_sell_record.save()
        order = Order(name=datetime.datetime.now().strftime('%Y%m%d%H%M%S'), customer=customer,
                                            phonenumber=phonenumber, address=address, remark=remark, all_price=price, updater=user,
                                            date=datetime.date.today())
        order.save()
        return HttpResponse(goodsshop.remain)


@login_required(login_url='/wsq/login')
def api_transfer(request):  # 调库
    if request.method == 'GET':
        goods_id = request.GET['goods_id']
        shop_id = request.GET['shop_id']
        goodsshop = GoodsShop.objects.get(goods=Goods.objects.get(id=goods_id), shop=Shop.objects.get(id=shop_id))
        transfer_shops = TransferShop.objects.all()
        return render_to_response('modal_transfer.html',
                                  {'request': request, 'goodsshop': goodsshop, 'transfer_shops': transfer_shops})
    elif request.method == 'POST':
        user = request.user
        if not user:
            return HttpResponse("false")
        to_shop_id = request.POST['to_shop_id']
        goods_id = request.POST['goods_id']
        shop_id = request.POST['shop_id']
        number = int(request.POST['number'])
        remark = request.POST.get('remark', '无')

        goods = Goods.objects.get(id=goods_id)
        shop = Shop.objects.get(id=shop_id)
        goodsshop = GoodsShop.objects.get(goods__id=goods_id, shop__id=shop_id)
        rem = goodsshop.remain
        if number > rem:
            return HttpResponse('chaoguo')
        transfer_shop = TransferShop.objects.get(id=to_shop_id)

        goods_record = GoodsRecord(goods=goods, shop=shop, change_num=(-number), updater=user)
        goods_record.save()

        transfer_record = TransferRecord(transfer_shop=transfer_shop, goods=goods, count=number, remark=remark,
                                         updater=user)
        transfer_record.save()

        goodsshop.remain -= int(number)
        goodsshop.save()

        return HttpResponse(goodsshop.remain)


@login_required(login_url='/wsq/login')
def api_add(request):  # 进
    if request.method == 'GET':
        goods_id = request.GET['goods_id']
        shop_id = request.GET['shop_id']
        action = request.GET['action']
        goodsshop = GoodsShop.objects.get(goods__id=goods_id, shop__id=shop_id)
        inbound_channels = InboundChannel.objects.order_by('id')
        if action != 'add':
            return HttpResponse('error')
        return render_to_response('modal_add.html',
                                  {'request': request, 'goodsshop': goodsshop, 'inbound_channels': inbound_channels})
    elif request.method == 'POST':
        user = request.user
        if not user:
            return HttpResponse("false")
        shop_id = request.POST['shop_id']
        goods_id = request.POST['goods_id']
        number = int(request.POST['number'])
        price = request.POST.get('price')
        remark = request.POST.get('remark', "")
        inbound_channel_id = request.POST['inbound_channel_id']
        if price:
            price = float(price)
            if price < 0:
                return HttpResponse('false')
        if number < 0:
            return HttpResponse('false')

        goodsshop = GoodsShop.objects.get(goods__id=goods_id, shop__id=shop_id)
        goods = Goods.objects.get(id=goods_id)
        shop = Shop.objects.get(id=shop_id)
        inbound_channel = InboundChannel.objects.get(id=inbound_channel_id)

        if not price:
            price = goods.last_price

        goods.average_price = round((goodsshop.remain * goods.average_price + int(number) * price) / (
            goodsshop.remain + int(number)), 2)
        goods.last_price = price
        goods.save()

        goods_record = GoodsRecord(goods=goods, shop=shop, change_num=number, updater=user)
        goods_record.save()

        goodsshop.remain += int(number)
        goodsshop.save()

        goods_add_record = GoodsAddRecord(goods=goods, shop=shop, number=number, price=price,
                                          inbound_channel=inbound_channel, remark=remark, updater=user)
        goods_add_record.save()

        return HttpResponse(goodsshop.remain)


def api_sell_info(request):
    if request.method == 'GET':
        sell_record_id = request.GET['sell_record_id']
        record = GoodsSellRecord.objects.get(id=sell_record_id)  # sell_record已经被之前的一个函数使用了
        return render_to_response('modal_sell_info.html', {'request': request, 'record': record})


def api_order_info(request):
    if request.method == 'GET':
        order_id = request.GET['order_id']
        order = Order.objects.get(id=order_id)
        return render_to_response('modal_order_info.html', {'request': request, 'order': order})




@login_required(login_url='/wsq/login')
def api_update(request):
    if request.method == 'GET':
        goods_id = request.GET['goods_id']
        goods = Goods.objects.get(id=goods_id)
        return render_to_response('modal_update.html', {'request': request, 'goods': goods})
    elif request.method == 'POST':
        user = request.user
        if not user.is_superuser:
            return HttpResponse("stop")
        old_goods_name = request.POST['old_goods_name']
        old_goods_price = request.POST['old_goods_price']
        name = request.POST['name']
        goods_id = request.POST['goods_id']
        price = request.POST['price']
        # last_prive = request.POST['last_price']
        if old_goods_name == name:
            records = GoodsRecord.objects.filter(goods__name=old_goods_name)
            if records:
                return HttpResponse('not_update_name')

        goods = Goods.objects.get(id=goods_id)
        goods.name = name
        goods.average_price = price
        # goods.last_price = last_prive
        goods.update_date = datetime.date.today()
        goods.save()

        return HttpResponse(goods.name)


@login_required(login_url='/wsq/login')
def api_update_count(request):
    if request.method == 'GET':
        goods_id = request.GET['goods_id']
        shop_id = request.GET['shop_id']
        goods_shop = GoodsShop.objects.get(goods__id=goods_id, shop__id=shop_id)
        return render_to_response('modal_update_count.html', {'request': request, 'goods_shop': goods_shop})
    elif request.method == 'POST':
        user = request.user
        goods_id = request.POST['goods_id']
        shop_id = request.POST['shop_id']
        real_count = request.POST['real_count']
        goods_shop = GoodsShop.objects.get(goods__id=goods_id, shop__id=shop_id)
        old_count = goods_shop.remain

        change_count_record = ChangeCountRecord(goods=goods_shop.goods, old_count=old_count, real_count=real_count,
                                                updater=user)
        change_count_record.save()

        goods_shop.remain = real_count
        goods_shop.save()

        return HttpResponse(goods_shop.remain)


@login_required(login_url='/wsq/login')
def out_in(request):
    today = datetime.date.today()
    every_day_sell_records = []
    for i in range(0, 10):
        that_day = today - datetime.timedelta(days=i)
        goods_records = GoodsRecord.objects.filter(date__year=that_day.year, date__month=that_day.month,
                                                   date__day=that_day.day).order_by('-date')
        day_and_records_map = {'date': that_day, 'records': goods_records}
        every_day_sell_records.append(day_and_records_map)
    header = title = '进出库记录'
    return render_to_response('out_in.html',
                              {'request': request, 'every_day_sell_records': every_day_sell_records, 'header': header,
                               'title': title})


@login_required(login_url='/wsq/login')
def out(request):
    today = datetime.date.today()
    every_day_sell_records = []
    for i in range(0, 10):
        that_day = today - datetime.timedelta(days=i)
        goods_records = GoodsRecord.objects.filter(date__year=that_day.year, date__month=that_day.month,
                                                   date__day=that_day.day, change_num__lte=0).order_by('-date')

        day_and_records_map = {'date': that_day, 'records': goods_records}
        every_day_sell_records.append(day_and_records_map)
    header = title = '出库记录'
    return render_to_response('out_in.html',
                              {'request': request, 'every_day_sell_records': every_day_sell_records, 'header': header,
                               'title': title})


@login_required(login_url='/wsq/login')
def in_(request):
    today = datetime.date.today()
    every_day_sell_records = []
    for i in range(0, 10):
        that_day = today - datetime.timedelta(days=i)
        goods_records = GoodsRecord.objects.filter(date__year=that_day.year, date__month=that_day.month,
                                                   date__day=that_day.day, change_num__gte=0).order_by('-date')

        day_and_records_map = {'date': that_day, 'records': goods_records}
        every_day_sell_records.append(day_and_records_map)
    header = title = '进库记录'
    return render_to_response('out_in.html',
                              {'request': request, 'every_day_sell_records': every_day_sell_records, 'header': header,
                               'title': title})


@login_required(login_url='/wsq/login')
def sell_record(request):
    today = datetime.date.today()
    every_day_sell_records = []
    receive = 0

    for i in range(0, 10):
        that_day = today - datetime.timedelta(days=i)
        # print(that_day)
        that_day_sell_records = GoodsSellRecord.objects.filter(date__year=that_day.year, date__month=that_day.month,
                                                               date__day=that_day.day, is_delete=False)
        that_day_other_cost_records = OtherCost.objects.filter(date__year=that_day.year, date__month=that_day.month,
                                                               date__day=that_day.day, is_delete=False)

        that_day_profit = 0
        that_day_cost = 0
        for record in that_day_sell_records:
            if i == 0:
                receive += record.get_receivable()
            that_day_profit += record.get_profit()
        for record in that_day_other_cost_records:
            that_day_cost += record.price

        pure_profit = that_day_profit - that_day_cost

        day_and_records_map = {'date': that_day, 'records': that_day_sell_records, 'profit': that_day_profit,
                               'cost': that_day_cost, 'pure_profit': pure_profit}
        every_day_sell_records.append(day_and_records_map)

    header = title = '今日实收：%s' % receive

    return render_to_response('sell_record.html',
                              {'request': request, 'every_day_sell_records': every_day_sell_records, 'header': header,
                               'title': title,
                               'receive': receive})


def delete_sell_record(request):
    if request.method == 'POST':
        user = request.user
        if not user:
            return HttpResponse("false")
        record_id = request.POST['record_id']
        sell_record = GoodsSellRecord.objects.get(id=record_id)
        if sell_record.is_delete == True:
            return HttpResponse('delete_false')
        goods_record = GoodsRecord(goods=sell_record.goods, shop=sell_record.shop, change_num=sell_record.sell_num,
                                   updater=user)
        goods_record.save()

        goodsshop = GoodsShop.objects.get(goods=sell_record.goods, shop=sell_record.shop)
        goodsshop.remain += sell_record.sell_num
        goodsshop.save()

        #goods_return_record = GoodsReturnRecord(goods_sell_record=sell_record, updater=user)
        #goods_return_record.save()

        sell_record.is_delete = True
        sell_record.save()
    return HttpResponse('success')


def delete_order_record(request):
    if request.method == 'POST':
        user = request.user
        if not user:
            return HttpResponse("false")
        order_id = request.POST['order_id']
        order = Order.objects.get(id=order_id)
        records = GoodsSellRecord.objects.filter(order=order, is_delete=False)
        for sell_record in records:
            sell_record.is_delete = True
            sell_record.save()

            goodsshop = GoodsShop.objects.get(goods=sell_record.goods, shop=sell_record.shop)
            goodsshop.remain += sell_record.sell_num
            goodsshop.save()

            goods_record = GoodsRecord(goods=sell_record.goods, shop=sell_record.shop, change_num=sell_record.sell_num,
                                       updater=user)
            goods_record.save()

            #return_record = GoodsReturnRecord(goods_sell_record=sell_record, updater=user)
            #return_record.save()
        order.is_delete = True
        order.save()
        return HttpResponse('success')


@login_required(login_url='/wsq/login')
def add_record(request):
    if not request.user.is_superuser:
        return HttpResponse('error')
    add_records = GoodsAddRecord.objects.filter(
        date__gt=datetime.date.today() - datetime.timedelta(days=3)).order_by(
        '-date')
    for record in add_records:
        record.all_price = record.price * record.number

    header = title = '进货记录'
    return render_to_response('add_record.html',
                              {'request': request, 'add_records': add_records, 'header': header, 'title': title})


def today_profit(request):
    if not request.user.is_superuser:
        return HttpResponse('error')
    today = datetime.date.today()
    sell_records = GoodsSellRecord.objects.filter(date__year=today.year, date__month=today.month,
                                                  date__day=today.day, is_delete=False).order_by('-date')
    cost_records = OtherCost.objects.filter(date__year=today.year, date__month=today.month,
                                            date__day=today.day, is_delete=False)
    all_profit = 0
    all_cost = 0
    all_sell = 0
    for record in sell_records:
        all_profit += record.get_profit()
        all_sell += record.sell_price * record.sell_num
    for record in cost_records:
        all_cost += record.price
    mao_profit = all_profit
    all_profit -= all_cost
    header = title = '今日利润：%s' % (all_profit,)
    return render_to_response('profit_check.html',
                              {'request': request, 'all_sell': all_sell, 'mao_profit': mao_profit,
                               'all_profit': all_profit,
                               'all_cost': all_cost,
                               'sell_records': sell_records,
                               'header': header,
                               'title': title})


def yesterday_profit(request):
    if not request.user.is_superuser:
        return HttpResponse('error')
    yesterday = datetime.date.today() - datetime.timedelta(days=1)
    sell_records = GoodsSellRecord.objects.filter(date__year=yesterday.year, date__month=yesterday.month,
                                                  date__day=yesterday.day, is_delete=False).order_by('-date')
    cost_records = OtherCost.objects.filter(date__year=yesterday.year, date__month=yesterday.month,
                                            date__day=yesterday.day, is_delete=False)
    all_profit = 0
    all_cost = 0
    all_sell = 0
    for record in sell_records:
        all_profit += record.get_profit()
        all_sell += record.sell_price * record.sell_num
    for record in cost_records:
        all_cost += record.price
    mao_profit = all_profit
    all_profit -= all_cost
    header = title = '昨日利润：%s' % (all_profit,)
    return render_to_response('profit_check.html',
                              {'request': request, 'all_sell': all_sell, 'mao_profit': mao_profit,
                               'all_profit': all_profit,
                               'all_cost': all_cost,
                               'sell_records': sell_records, 'header': header,
                               'title': title})


def this_month_profit(request):
    if not request.user.is_superuser:
        return HttpResponse('error')
    this_month_first_day = datetime.date(datetime.date.today().year, datetime.date.today().month, 1)
    sell_records = GoodsSellRecord.objects.filter(date__year=this_month_first_day.year,
                                                  date__month=this_month_first_day.month, is_delete=False).order_by(
        '-date')
    cost_records = OtherCost.objects.filter(date__year=this_month_first_day.year,
                                            date__month=this_month_first_day.month, is_delete=False)
    all_profit = 0
    all_cost = 0
    all_sell = 0
    for record in sell_records:
        all_profit += record.get_profit()
        all_sell += record.sell_price * record.sell_num
    for record in cost_records:
        all_cost += record.price
    mao_profit = all_profit
    all_profit -= all_cost
    header = title = '本月利润：%s' % (all_profit,)
    return render_to_response('profit_check.html',
                              {'request': request, 'all_sell': all_sell, 'mao_profit': mao_profit,
                               'all_profit': all_profit,
                               'all_cost': all_cost, 'select_date': this_month_first_day,
                               'sell_records': sell_records, 'header': header,
                               'title': title})


def last_month_profit(request):
    if not request.user.is_superuser:
        return HttpResponse('error')
    this_month_first_day = datetime.date(datetime.date.today().year, datetime.date.today().month, 1)
    last_month_last_day = this_month_first_day - datetime.timedelta(1)
    last_month_first_day = datetime.date(last_month_last_day.year, last_month_last_day.month, 1)
    sell_records = GoodsSellRecord.objects.filter(date__year=last_month_first_day.year,
                                                  date__month=last_month_first_day.month, is_delete=False).order_by(
        '-date')
    cost_records = OtherCost.objects.filter(date__year=last_month_first_day.year,
                                            date__month=last_month_first_day.month,
                                            is_delete=False)
    all_profit = 0
    all_cost = 0
    all_sell = 0
    for record in sell_records:
        all_profit += record.get_profit()
        all_sell += record.sell_price * record.sell_num
    for record in cost_records:
        all_cost += record.price
    mao_profit = all_profit
    all_profit -= all_cost
    header = title = '上月利润：%s' % (all_profit,)
    return render_to_response('profit_check.html',
                              {'request': request, 'all_sell': all_sell, 'mao_profit': mao_profit,
                               'all_profit': all_profit,
                               'all_cost': all_cost, 'select_date': last_month_first_day,
                               'sell_records': sell_records, 'header': header,
                               'title': title})


def other_month_profit(request):
    if not request.user.is_superuser:
        return HttpResponse('error')
    if request.method == 'GET':
        return render_to_response('check_profit.html', {'request': request, 'header': '月利润查询', 'title': '月利润查询'})
    elif request.method == 'POST':
        sdate = request.POST['date']
        select_date = datetime.datetime.strptime(sdate, '%Y-%m')
        sell_records = GoodsSellRecord.objects.filter(date__year=select_date.year,
                                                      date__month=select_date.month, is_delete=False).order_by(
            '-date')
        cost_records = OtherCost.objects.filter(date__year=select_date.year,
                                                date__month=select_date.month,
                                                is_delete=False)
        all_profit = 0
        all_cost = 0
        all_sell = 0
        for record in sell_records:
            all_profit += record.get_profit()
            all_sell += record.sell_price * record.sell_num
        for record in cost_records:
            all_cost += record.price
        mao_profit = all_profit
        all_profit -= all_cost
        header = title = '%s月利润：%s' % (select_date.month, all_profit,)
        return render_to_response('profit_check.html',
                                  {'request': request, 'all_sell': all_sell, 'mao_profit': mao_profit,
                                   'all_profit': all_profit,
                                   'all_cost': all_cost,
                                   'sell_records': sell_records, 'header': header,
                                   'title': title, 'select_date': select_date})



def inbound_channel(request):
    if request.method == 'GET':
        inbounds = InboundChannel.objects.exclude(name='无')
        return render_to_response('inbound_channel.html',
                                  {'request': request, 'inbounds': inbounds, 'title': '进货渠道', 'header': '进货渠道'})
    elif request.method == 'POST':
        name = request.POST['name']
        phonenumber = request.POST.get('phonenumber', '')
        inbound = InboundChannel(name=name, phonenumber=phonenumber)
        inbound.save()
        return HttpResponseRedirect(reverse('inbound_channel'))


def delete_inbound(request):
    if request.method == 'POST':
        inbound_id = request.POST['inbound_id']
        inbound = InboundChannel.objects.get(id=inbound_id)
        inbound.delete()
        return HttpResponse('success')


def delete_transfer_shop(request):
    if request.method == 'POST':
        shop_id = request.POST['shop_id']
        shop = TransferShop.objects.get(id=shop_id)
        shop.delete()
        return HttpResponse('success')


def order_manage(request):
    orders = Order.objects.all().filter(is_delete=False).order_by('-date')
    return render_to_response('order_manage.html',
                              {'request': request, 'orders': orders, 'header': '订单管理', 'title': '订单管理'})


#def goods_return_record(request):
    #records = GoodsReturnRecord.objects.all().order_by('-date')
    #return render_to_response("goods_return_record.html",
                             # {'request': request, 'records': records, 'title': '退库记录', 'header': '退库记录'})


def other_cost(request):
    if request.method == 'GET':
        today = datetime.date.today()
        every_day_cost_records = []
        total_cost = 0
        for i in range(0, 10):
            that_day = today - datetime.timedelta(days=i)
            that_day_other_cost_records = OtherCost.objects.filter(date__year=that_day.year, date__month=that_day.month,
                                                                   date__day=that_day.day, is_delete=False)

            that_day_cost = 0
            for record in that_day_other_cost_records:
                if i == 0:
                    total_cost += record.price
                that_day_cost += record.price

            day_and_cost_map = {'date': that_day, 'records': that_day_other_cost_records, 'cost': that_day_cost}
            every_day_cost_records.append(day_and_cost_map)

        header = title = '今日开销：%s' % (total_cost,)

        return render_to_response('other_cost.html',
                                  {'request': request, 'every_day_cost_records': every_day_cost_records,
                                   'header': header, 'title': title})
    elif request.method == 'POST':
        user = request.user
        purpose = request.POST['purpose']
        price = request.POST['price']
        cost = OtherCost(purpose=purpose, price=price, updater=user)
        cost.save()
        return HttpResponseRedirect(reverse('other_cost'))


def transfer_shop_manage(request):
    if request.method == 'GET':
        shops = TransferShop.objects.all()
        return render_to_response('transfer_shop_manage.html',
                                  {'request': request, 'shops': shops, 'title': '调入方', 'header': '调入方'})
    elif request.method == 'POST':
        name = request.POST['name']
        phonenumber = request.POST.get('phonenumber', '')
        shop = TransferShop(name=name, phonenumber=phonenumber)
        shop.save()
        return HttpResponseRedirect(reverse('transfer_shop_manage'))


def transfer_record(request):
    today = datetime.date.today()
    every_day_transfer_record = []
    for i in range(0, 10):
        that_day = today - datetime.timedelta(days=i)
        transfer_records = TransferRecord.objects.filter(date__year=that_day.year, date__month=that_day.month,
                                                         date__day=that_day.day).order_by('-date')
        day_and_records_map = {'date': that_day, 'records': transfer_records}
        every_day_transfer_record.append(day_and_records_map)
    return render_to_response('goods_transfer_record.html',
                              {'request': request, 'every_day_transfer_record': every_day_transfer_record,
                               'title': '调库记录', 'header': '调库记录'})


def profit_chart(request):
    title = '利润走势'
    if not request.user.is_superuser:
        return HttpResponse('error')
    profit_list = []

    month1 = datetime.date(datetime.date.today().year, datetime.date.today().month, 1)
    month2 = datetime.date((month1 - datetime.timedelta(1)).year, (month1 - datetime.timedelta(1)).month, 1)
    month3 = datetime.date((month2 - datetime.timedelta(1)).year, (month2 - datetime.timedelta(1)).month, 1)
    month4 = datetime.date((month3 - datetime.timedelta(1)).year, (month3 - datetime.timedelta(1)).month, 1)
    month5 = datetime.date((month4 - datetime.timedelta(1)).year, (month4 - datetime.timedelta(1)).month, 1)
    month6 = datetime.date((month5 - datetime.timedelta(1)).year, (month5 - datetime.timedelta(1)).month, 1)
    month7 = datetime.date((month6 - datetime.timedelta(1)).year, (month6 - datetime.timedelta(1)).month, 1)

    sell_records1 = GoodsSellRecord.objects.filter(date__year=month1.year,
                                                   date__month=month1.month, is_delete=False).order_by('-date')
    profit1 = 0
    for record in sell_records1:
        profit1 += record.get_profit()
    profit_list.append({'month': month1, 'profit': profit1})
    # =============================
    sell_records2 = GoodsSellRecord.objects.filter(date__year=month2.year,
                                                   date__month=month2.month, is_delete=False).order_by('-date')
    profit2 = 0
    for record in sell_records2:
        profit2 += record.get_profit()
    profit_list.append({'month': month2, 'profit': profit2})
    # =============================
    sell_records3 = GoodsSellRecord.objects.filter(date__year=month3.year,
                                                   date__month=month3.month, is_delete=False).order_by('-date')
    profit3 = 0
    for record in sell_records3:
        profit3 += record.get_profit()
    profit_list.append({'month': month3, 'profit': profit3})
    # =============================
    sell_records4 = GoodsSellRecord.objects.filter(date__year=month4.year,
                                                   date__month=month4.month, is_delete=False).order_by('-date')
    profit4 = 0
    for record in sell_records4:
        profit4 += record.get_profit()
    profit_list.append({'month': month4, 'profit': profit4})
    # =============================
    sell_records5 = GoodsSellRecord.objects.filter(date__year=month5.year,
                                                   date__month=month5.month, is_delete=False).order_by('-date')
    profit5 = 0
    for record in sell_records5:
        profit5 += record.get_profit()
    profit_list.append({'month': month5, 'profit': profit5})
    # =============================
    sell_records6 = GoodsSellRecord.objects.filter(date__year=month6.year,
                                                   date__month=month6.month, is_delete=False).order_by('-date')
    profit6 = 0
    for record in sell_records6:
        profit6 += record.get_profit()
    profit_list.append({'month': month6, 'profit': profit6})
    # =============================
    sell_records7 = GoodsSellRecord.objects.filter(date__year=month7.year,
                                                   date__month=month7.month, is_delete=False).order_by('-date')
    profit7 = 0
    for record in sell_records7:
        profit7 += record.get_profit()
    profit_list.append({'month': month7, 'profit': profit7})
    # =============================

    # return HttpResponse(profit_list)
    return render_to_response('profit_chart.html',
                              {'request': request, 'profit_list': profit_list, 'header': title, 'title': title})


def sell_ranking_chart(request):
    goods = Goods.objects.filter(is_delete=False)
    sell_arrar = []
    for good in goods:
        sell_count = 0
        sell_records = GoodsSellRecord.objects.filter(is_delete=False,goods=good)
        for record in sell_records:
            sell_count += record.sell_num
        sell_arrar.append({'goods': good, 'sell_count': sell_count})
        sell_arrar.sort(key=cmp_to_key(lambda y, x: operator.eq(x['sell_count'], y['sell_count'])))
    goods_name_arrar = []
    for rank in sell_arrar:
        goods_name_arrar.append(rank['goods'].goods_name)
    title = '销量排行'
    return render_to_response('sell_ranking_chart.html',
                              {'request': request, 'sell_arrar': sell_arrar, 'goods_name_arrar': goods_name_arrar,
                               'header': title, 'title': title})

