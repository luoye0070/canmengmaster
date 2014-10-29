package lj.shop

import lj.data.FoodClassInfo
import lj.data.UserInfo
import lj.enumCustom.ReCode
import org.springframework.dao.DataIntegrityViolationException

class FoodClassManageService {

    def webUtilService;
    def shopService;
    /**
     *
     * @author 刘兆国
     * @param params 参数map
     * max 每页数量, 非必须
     * offset 位置,非必须
     * @return
     * @Date: 2013-12-5
     * @Time: 上午10: 26
     */
    def list(params) {
        def g = new org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib();
        try {
            //取出用户
            UserInfo userInfo=webUtilService.getUser();
            if(userInfo){
                long restaurantId=0;

                //检查店铺可用性
                def reInfo=shopService.getShopEnabled();
                if(reInfo.recode!=ReCode.OK){
                    return reInfo;
                }
                else{
                    restaurantId=reInfo.restaurantInfo.id;
                }
                //获取店铺
                //if (params.max == null) params.max = 10;
                def condition={eq("restaurantId",restaurantId);}
                return [recode: ReCode.OK] << [foodClassInfoInstanceList: FoodClassInfo.createCriteria().list(params,condition), foodClassInfoInstanceTotal: FoodClassInfo.createCriteria().count(condition)]
            } else {
                return [recode: ReCode.NOT_LOGIN];
            }
        } catch (Exception e) {
            println new Date().format("yyyy-MM-dd HH:mm:ss") + g.message(code: 'foodClassInfo.label', default: 'FoodClassInfo') + "列表异常：" + e.message
            return [recode: ReCode.SYSTEM_EXCEPTION];
        }
    }
    /**
     *
     * <p></p>
     * @author 刘兆国
     * @param getNew 是否创建一个新的
     * @param params 对象参数
     * @return
     * @Date: 2013-12-5
     * @Time: 上午10: 26
     */
    def get(boolean getNew, def params) {
        def g = new org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib();
        try {
            //取出用户
            UserInfo userInfo=webUtilService.getUser();
            if(userInfo){
                long restaurantId=0;

                //检查店铺可用性
                def reInfo=shopService.getShopEnabled();
                if(reInfo.recode!=ReCode.OK){
                    return reInfo;
                }
                else{
                    restaurantId=reInfo.restaurantInfo.id;
                }
                def foodClassInfoInstance = null;
                if (getNew) {
                    params.restaurantId=restaurantId;
                    foodClassInfoInstance = new FoodClassInfo(params);
                } else {
                    long id =  lj.Number.toLong(params.id);
                    foodClassInfoInstance = FoodClassInfo.findByIdAndRestaurantId(id,restaurantId);
                    if (!foodClassInfoInstance) {
                        return [recode: ReCode.NO_RESTAURANTINFO];
                    }
                }
                return [recode: ReCode.OK, foodClassInfoInstance: foodClassInfoInstance];
            } else {
                return [recode: ReCode.NOT_LOGIN];
            }
        } catch (Exception e) {
            println new Date().format("yyyy-MM-dd HH:mm:ss") + " 获取" + g.message(code: 'foodClassInfo.label', default: 'FoodClassInfo') + "信息异常：" + e.message
            return [recode: ReCode.SYSTEM_EXCEPTION];
        }
    }
    /**
     *
     * <p></p>
     * @author 刘兆国
     * @param params 参数map
     * @return
     * @Date: 2013-11-27
     * @Time: 下午17: 56
     */
    def add(def params) {
        def g = new org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib();
        try {
            //取出用户
            UserInfo userInfo=webUtilService.getUser();
            if(userInfo){
                long restaurantId=0;

                //检查店铺可用性
                def reInfo=shopService.getShopEnabled();
                if(reInfo.recode!=ReCode.OK){
                    return reInfo;
                }
                else{
                    restaurantId=reInfo.restaurantInfo.id;
                }
                params.restaurantId=restaurantId;
                def foodClassInfoInstance = new FoodClassInfo(params);

                if (!foodClassInfoInstance.save(flush: true)) {
                    return [recode: ReCode.SAVE_FAILED, foodClassInfoInstance: foodClassInfoInstance];
                }
                return [recode: ReCode.OK, foodClassInfoInstance: foodClassInfoInstance];
            } else {
                return [recode: ReCode.NOT_LOGIN];
            }
        } catch (Exception e) {
            println new Date().format("yyyy-MM-dd HH:mm:ss") + " 保存" + g.message(code: 'foodClassInfo.label', default: 'FoodClassInfo') + "异常：" + e.message
            return [recode: ReCode.SYSTEM_EXCEPTION];
        }
    }
    /**
     * 修改
     * <p>修改</p>
     * @author 刘兆国
     * @param params 参数map
     * @return
     * @Date: 2013-11-28
     * @Time: 上午11: 37
     */
    def update(def params) {
        def g = new org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib();
        try {
            //取出用户
            UserInfo userInfo=webUtilService.getUser();
            if(userInfo){
                long restaurantId=0;

                //检查店铺可用性
                def reInfo=shopService.getShopEnabled();
                if(reInfo.recode!=ReCode.OK){
                    return reInfo;
                }
                else{
                    restaurantId=reInfo.restaurantInfo.id;
                }
                def foodClassInfoInstance = null;

                long id = lj.Number.toLong(params.id);
                foodClassInfoInstance = FoodClassInfo.findByIdAndRestaurantId(id,restaurantId);

                if (!foodClassInfoInstance) {
                    return [recode: ReCode.NO_RESTAURANTINFO];
                }

                if (params.version != null) {
                    long version = lj.Number.toLong(params.version);
                    if (foodClassInfoInstance.version > version) {
                        foodClassInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                                [g.message(code: 'foodClassInfo.label', default: 'FoodClassInfo')] as Object[],
                                "在你编辑时，其他用户已经更新了数据")
                        return [recode: ReCode.SAVE_FAILED, foodClassInfoInstance: foodClassInfoInstance];
                    }
                }

                foodClassInfoInstance.properties = params

                if (!foodClassInfoInstance.save(flush: true)) {
                    return [recode: ReCode.SAVE_FAILED, foodClassInfoInstance: foodClassInfoInstance];
                }
                return [recode: ReCode.OK, foodClassInfoInstance: foodClassInfoInstance];
            } else {
                return [recode: ReCode.NOT_LOGIN];
            }
        } catch (Exception e) {
            println new Date().format("yyyy-MM-dd HH:mm:ss") + " 修改" + g.message(code: 'foodClassInfo.label', default: 'FoodClassInfo') + "异常：" + e.message
            return [recode: ReCode.SYSTEM_EXCEPTION];
        }
    }

    /**
     * 根据ID删除一个
     * <p>根据ID删除一个</p>
     * @author 刘兆国
     * @param long Id
     * @return
     * @Date: 2013-12-5
     * @Time: 上午10: 26
     */
    def delete(Long id) {
        def g = new org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib();
        try {
            //取出用户
            UserInfo userInfo=webUtilService.getUser();
            if(userInfo){
                long restaurantId=0;

                //检查店铺可用性
                def reInfo=shopService.getShopEnabled();
                if(reInfo.recode!=ReCode.OK){
                    return reInfo;
                }
                else{
                    restaurantId=reInfo.restaurantInfo.id;
                }
                def foodClassInfoInstance = FoodClassInfo.findByIdAndRestaurantId(id,restaurantId);
                if (!foodClassInfoInstance) {
                    def message = g.message(code: 'default.not.found.message', args: [g.message(code: 'foodClassInfo.label', default: 'FoodClassInfo'), id])
                    //redirect(action: "list")
                    return [recode: [code: ReCode.NO_RESTAURANTINFO.code, label: message]];
                }

                try {
                    foodClassInfoInstance.delete(flush: true)
                    def message = g.message(code: 'default.deleted.message', args: [g.message(code: 'foodClassInfo.label', default: 'FoodClassInfo'), id])
                    //redirect(action: "list")
                    return [recode: [code: ReCode.OK.code, label: message]];
                } catch (DataIntegrityViolationException e) {
                    def message = g.message(code: 'default.not.deleted.message', args: [g.message(code: 'foodClassInfo.label', default: 'FoodClassInfo'), id])
                    //redirect(action: "show", id: id)
                    return [recode: [code: ReCode.SAVE_FAILED.code, label: message]];
                }
            } else {
                return [recode: ReCode.NOT_LOGIN];
            }
        } catch (Exception e) {
            println new Date().format("yyyy-MM-dd HH:mm:ss") + " 根据ID删除一个" + g.message(code: 'foodClassInfo.label', default: 'FoodClassInfo') + "异常：" + e.message
            return [recode: ReCode.SYSTEM_EXCEPTION];
        }
    }

}
