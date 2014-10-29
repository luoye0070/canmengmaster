package lj.data

//菜单
class FoodInfo {

    //饭店ID
    long restaurantId
    //菜名
    String name
    //价格
    Double price=0.0
    //原价
    Double originalPrice
    //图片
    String image
    //是否支持外卖true支持false不支持
    Boolean canTakeOut=false
    //描述
    String description
    //状态（有效性）true有效false无效
    Boolean enabled=true;
    //每天限量0表示不限量
    Integer countLimit=0
    //是否套餐
    Boolean isSetMeal=false
    //当天销量
    int sellCount=0;
    //累计销量
    int totalSellCount=0;
    //已经做好的
    boolean isReady=false;
    //类别
    long classId=0l;
    static constraints = {
        restaurantId(nullable:false,min: 1l)
        name (nullable: false,blank:false,maxSize:32 )
        price(nullable: false, min:0.0d)
        originalPrice (nullable:true,min:0.0d)
        image (nullable:true,blank: true, maxSize:128)
        canTakeOut(nullable: false)
        description (nullable:true,blank: true,maxSize:1024*1024)
        enabled(nullable: false)
        countLimit (nullable: false,min:0)
        isSetMeal(nullable: false)
        sellCount(nullable: false,min:0)
        totalSellCount(nullable: false,min:0);
        isReady(nullable:false);
        classId(nullable:true,min: 0l);
    }
}
