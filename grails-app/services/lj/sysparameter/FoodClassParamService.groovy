package lj.sysparameter

import lj.data.FoodClassInfo
import lj.enumCustom.ReCode

class FoodClassParamService {

    //获取所有系统定义的菜品类别
    def getFoodClassList() {
        def foodClassList= FoodClassInfo.all;
        if(foodClassList){
            return [recode: ReCode.OK,foodClassList:foodClassList];
        }
        else{
            return [recode:ReCode.NO_RESULT];
        }
    }
    //根据菜品ID获取名称
    def getFoodClassById(long id){
        FoodClassInfo foodClassInfo=FoodClassInfo.findById(id);
        if(foodClassInfo){
            return [recode: ReCode.OK,foodClassInfo:foodClassInfo];
        }
        else{
            return [recode:ReCode.NO_RESULT];
        }
    }
    //根据饭店ID获取菜品类别
    def getFoodClassList(long restaurantId){
        def foodClassList= FoodClassInfo.findAllByRestaurantId(restaurantId);
        if(foodClassList){
            return [recode: ReCode.OK,foodClassList:foodClassList];
        }
        else{
            return [recode:ReCode.NO_RESULT];
        }
    }
}
