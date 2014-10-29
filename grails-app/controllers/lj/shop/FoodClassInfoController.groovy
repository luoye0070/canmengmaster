package lj.shop

import lj.enumCustom.ReCode

class FoodClassInfoController {

    def webUtilService;
    def foodClassManageService;
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        //redirect(action: "list", params: params)
    }

    def list(Integer max) {
        foodClassManageService.list(params);
    }

    def create() {
        def reInfo=foodClassManageService.get(true,params);
        [foodClassInfoInstance: reInfo.foodClassInfoInstance];
    }

    def save() {
        def reInfo=foodClassManageService.add(params);
        println("reInfo-->"+reInfo);
        if(reInfo.recode== ReCode.OK){
            flash.message = reInfo.recode.label;
            redirect(action: "list", id: reInfo.foodClassInfoInstance.id)
        }else{
            if(reInfo.recode!=ReCode.SAVE_FAILED){
                flash.message =reInfo.recode.label;
            }
            render(view: "/foodClassInfo/create", model: [foodClassInfoInstance: reInfo.foodClassInfoInstance]);
        }
    }

    def show(Long id) {
        def reInfo=foodClassManageService.get(false,params);
        if(reInfo.recode!=ReCode.OK){
            flash.message =reInfo.recode.label;
            redirect(action: "list")
            return
        }
        [foodClassInfoInstance: reInfo.foodClassInfoInstance]
    }

    def edit(Long id) {
        def reInfo=foodClassManageService.get(false,params);
        if(reInfo.recode!=ReCode.OK){
            flash.message =reInfo.recode.label;
            redirect(action: "list")
            return
        }
        [foodClassInfoInstance: reInfo.foodClassInfoInstance]
    }

    def update(Long id, Long version) {
        def reInfo=foodClassManageService.update(params);
        if(reInfo.recode== ReCode.OK){
            flash.message = reInfo.recode.label;
            redirect(action: "list", id: reInfo.foodClassInfoInstance.id)
        }else{
            if(reInfo.recode!=ReCode.SAVE_FAILED){
                flash.error=reInfo.recode.label;
            }
            render(view: "/foodClassInfo/edit", model: [foodClassInfoInstance: reInfo.foodClassInfoInstance]);
        }
    }

    def delete(Long id) {
        def reInfo = foodClassManageService.delete(id);
        flash.message =reInfo.recode.label;
        redirect(action: "list");
    }

}
