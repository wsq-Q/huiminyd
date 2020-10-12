from django.conf.urls import patterns, include, url
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
                       url('^admin/', include(admin.site.urls)),
                       url(r'^wsq/', include('wsq.urls')),
                       url(r'^$', 'wsq.views.all_goods'),
                       )
