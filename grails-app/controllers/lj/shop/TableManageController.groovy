package lj.shop

import lj.data.RestaurantInfo
import lj.enumCustom.ReCode
import lj.enumCustom.VerifyStatus

class TableManageController {
    TableManageService tableManageService;
    ShopService shopService;
    def index() {}

    //桌位列表
    def tableList(){
        def err=null;
        def msg=null;

        def reInfo=tableManageService.tableList(params);

        render(view: "tableList",model: reInfo);
    }
    //桌位标贴打印
    def printTable(){
        //获取饭店信息
        RestaurantInfo restaurantInfo=null;
        def reInfo=shopService.getShopInfo(params);
        if (reInfo.recode==ReCode.OK){
            if(reInfo.restaurantInfo){
                restaurantInfo=reInfo.restaurantInfo;
            }
        }
        //获取桌位信息
        if(!lj.Number.toInteger(params.max))
            params.max=3;
        def reInfo1=tableManageService.tableList(params);
        reInfo=reInfo1<<[restaurantInfo:restaurantInfo];
        println("reInfo-->"+reInfo);
        render(view: "printTable",model: reInfo);
    }
    //桌位编辑
    def editTableInfo(){
        def err=null;
        def msg=null;
        def tableInfoInstance=null;
        println("id-->>>"+params.id);
        if(request.method=="GET"){
            if(!params.id){
                params.id=-1;
            }
            def reInfo=tableManageService.getTableInfo(params); //根据ID查询到一个菜单
            if(reInfo.recode==ReCode.OK){
                tableInfoInstance=reInfo.tableInfo;
            }
        }
        else if(request.method=="POST"){
            params.id=params.tableId;
            def reInfo=tableManageService.save(params);
            if(reInfo.recode==ReCode.OK){
                msg="保存成功";
                redirect(action:"tableList")
                return
            }
            else if(reInfo.recode==ReCode.SAVE_FAILED){
                err=lj.I118Error.getMessage(g,reInfo.errors,0);
            }
            else {
                err=lj.I118Error.getMessage(g,reInfo.recode.label,0);
            }
            tableInfoInstance=reInfo.tableInfo;
        }

        render(view: "editTableInfo",model: [tableInfoInstance:tableInfoInstance,err:err,msg:msg]);
    }
    //桌位删除
    def delTableInfo(){
        def reInfo=tableManageService.deleteTable(params);
        if(reInfo.recode==ReCode.OK){//删除成功
            flash.message=reInfo.recode.label;
        }
        else{
            flash.message=reInfo.recode.label;
        }
        redirect(controller: "tableManage",action: "tableList");
    }
}
