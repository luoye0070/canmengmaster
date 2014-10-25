package lj.order.common
import lj.Number
import lj.data.ClientInfo
import lj.enumCustom.ReCode;
class CartService {
    //根据客户ID和饭店ID获取或创建一个购物车对象
    def getOrCreateCart(def params){
        //获取参数
        long clientId=Number.toLong(params.clientId); //可以为0，当创建
        long restaurantId=Number.toLong(params.restaurantId);
        if(restaurantId==0){
            return [recode: ReCode.ERROR_PARAMS];
        }
        //检查客户id是否正确
        ClientInfo clientInfo=ClientInfo.get(clientId);
        if(clientInfo==null){
            return [recode: ReCode.ERROR_PARAMS];
        }
    }
}
