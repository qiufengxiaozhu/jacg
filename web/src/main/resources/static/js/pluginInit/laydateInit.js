$(document).ready(function () {
    //时间控件开始
    var startDate=$("body").find("input[startDate],input[startdate]");
    var endDate=$("body").find("input[endDate],input[enddate]");
    var now=new Date();
    var endNow=new Date();
    endNow.setDate(endNow.getDate()+1);
    for(var k=0;k<startDate.length;k++){
        var isOnly=true;
        for(var b=0;b<endDate.length;b++){
            if($(startDate[k]).attr("startDate")==$(endDate[b]).attr("endDate") || $(startDate[k]).attr("startdate")==$(endDate[b]).attr("enddate")){
                if(typeof $(endDate[b]).attr('time') =='undefined'){
                    data(startDate[k],endDate[b],null);
                }else{
                    data(startDate[k],endDate[b],$(endDate[b]).attr('time'));
                }
                isOnly=false;
                break;
            }
        }
        if(isOnly){
            if(typeof $(startDate[k]).attr('time')=='undefined'){
                data1(startDate[k],null);
            }else{
                data1(startDate[k],$(startDate[k]).attr('time'));
            }
        }
    }
    function data1(start,isNow) {
        var id=$(start).attr("id");
        var da=zudp.util.timeformater(Date.parse(now));
        if(isNow!=null){
            da=isNow
        }
        start=laydate.render({
                                   elem:"#"+id,
                                   type:'date',
                                   btns: ['clear', 'confirm'],
                                   max:da
                               });
    }

    function data(start,end,isNow) {
        var id=$(start).attr("id");
        var year=2099;
        var month=12;
        var day=31;
        if(isNow!=null){
            var k=isNow.split("-");
            year=k[0];
            month=k[1];
            day=k[2];
        }

        start=laydate.render({
                                    elem:"#"+id,
                                    type:'date',
                                    btns: ['clear', 'confirm'],
                                    max: zudp.util.timeformater(Date.parse(now)),
                                    done: function (value, date) {
                                        if( value !== ''){
                                            end.config.min.year = date.year;
                                            end.config.min.month = date.month-1;
                                            end.config.min.date = date.date + 1;
                                        }else{
                                            end.config.min.year = year;
                                            end.config.min.month = month;
                                            end.config.min.date = day;
                                        }
                                    }
                                });
        var endId=$(end).attr("id");
        var da=zudp.util.timeformater(Date.parse(endNow));
        if(isNow!=null){
            da=isNow;
        }
        end=laydate.render({
                                  elem: '#'+endId,
                                  type: 'date',
                                  max: da,
                                  done: function (value, date) {
                                      if (value !== '') {
                                          start.config.max.year = date.year;
                                          start.config.max.month = date.month - 1;
                                          start.config.max.date = date.date - 1;
                                      } else {
                                          start.config.max.year = 2099;
                                          start.config.max.month = 12;
                                          start.config.max.date = 31;
                                      }
                                  }
                              });
    }
//时间控件结束
});

