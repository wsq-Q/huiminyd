from django.contrib import admin
#
# # Register your models here.
#
#from .models import Shop, GoodsShop, GoodsRecord, Goods, GoodsAddRecord, GoodsSellRecord, InboundChannel, Order, \
#    GoodsReturnRecord, TransferShop, TransferRecord
from .models import Shop, GoodsShop, GoodsRecord, Goods, GoodsAddRecord, GoodsSellRecord, InboundChannel, Order, \
     TransferShop, TransferRecord

admin.site.register(Shop)
#
admin.site.register(GoodsShop)
admin.site.register(GoodsRecord)
admin.site.register(GoodsAddRecord)
admin.site.register(InboundChannel)
admin.site.register(Order)
#admin.site.register(GoodsReturnRecord)
admin.site.register(TransferShop)
admin.site.register(TransferRecord)

class GoodsAdmin(admin.ModelAdmin):
    list_display = ('goods_name', 'average_price', 'last_price', 'update_date')


class GoodsSellRecordAdmin(admin.ModelAdmin):
    list_display = ('id', 'goods', 'date')


admin.site.register(Goods, GoodsAdmin)
admin.site.register(GoodsSellRecord, GoodsSellRecordAdmin)
