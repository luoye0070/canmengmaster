<%@ page import="lj.enumCustom.DishesValid; lj.enumCustom.DishesStatus; lj.enumCustom.OrderValid; lj.enumCustom.OrderStatus; lj.enumCustom.ReserveType; lj.FormatUtil; lj.data.OrderInfo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main_template">
    <g:set var="entityName" value="${message(code: 'orderInfo.label', default: 'OrderInfo')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <style type="text/css">
    .mc_main {
        width: 1000px;
        height: auto;
        margin: 0px 50px;
        background-color: #FFFFFF;
        float: left;
    }

    .mcm_top {
        width: 960px;
        height: 80px;
        margin: 20px;
        margin-top: 0px;
        border-bottom: 4px solid #FF9833;
        text-indent: 1em;
        line-height: 80px;
        font-size: 20px;
        font-weight: bolder;
    }

    .mcm_content {
        width: 960px;
        height: auto;
        margin: 20px;
    }

    .mcmc_detail {
        width: 900px;
        height: auto;
        margin-left: 30px;
        margin-right: 30px;
        float: left;
        border-bottom: 2px solid #DDDDDD;
        margin-bottom: 20px;
    }

    .mcmcd_title {
        width: 900px;
        height: 30px;
        line-height: 30px;
        float: left;
        overflow: hidden;
    }

    .mcmcdt_ico {
        border-left: 7px solid #FF9833;
        border-right: 7px solid #FFF;
        border-top: 7px solid #FFF;
        border-bottom: 7px solid #FFF;
        margin-top: 8px;
        margin-bottom: 8px;
        width: 0;
        height: 0;
        float: left;
    }

    .mcmcdt_info {
        color: #FF9833;
        float: left;
        font-size: 15px;
    }

    .mcmcd_item {
        width: 300px;
        height: 30px;
        line-height: 30px;
        float: left;
        overflow: hidden;
    }

    .mcmcdi_label {
        width: 100px;
        height: 30px;
        float: left;
        color: #C2BFBF;
        overflow: hidden;
    }

    .mcmcdi_info {
        width: 200px;
        height: 30px;
        float: left;
        overflow: hidden;
    }

    </style>
</head>

<body>
<div class="mc_main">
<div class="mcm_top">
    订单${params.orderId}-详情
</div>

<div class="mcm_content">

<g:if test="${flash.error}">
    <div class="alert alert-error">
        ${flash.error}
    </div>
</g:if>
<g:if test="${flash.message}">
    <div class="alert alert-info">
        ${flash.message}
    </div>
</g:if>

<div class="mcmc_detail">
<!--订单信息-->
<div class="mcmcd_title">
    <div class="mcmcdt_ico"></div>

    <div class="mcmcdt_info">订单信息</div>
</div>
<g:if test="${orderInfoInstance?.id}">

    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.id.label" default="id"/>
        </div>

        <div class="mcmcdi_info" style="color: #FE4B1E;">
            <g:fieldValue bean="${orderInfoInstance}" field="id"/>
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.restaurantId}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.restaurantId.label" default="Restaurant Id"/>
        </div>

        <div class="mcmcdi_info" style="color: #FE4B1E;">
            <g:fieldValue bean="${orderInfoInstance}" field="restaurantId"/>
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.tableId}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.tableId.label" default="Table Id"/>
        </div>

        <div class="mcmcdi_info" style="color: #FE4B1E;">
            <g:fieldValue bean="${orderInfoInstance}" field="tableId"/>
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.partakeCode}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.partakeCode.label" default="Partake Code"/>
        </div>

        <div class="mcmcdi_info" style="color: #FE4B1E;">
            <g:fieldValue bean="${orderInfoInstance}" field="partakeCode"/>
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.restaurantName}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.restaurantName.label" default="restaurantName"/>
        </div>

        <div class="mcmcdi_info">
            <g:fieldValue bean="${orderInfoInstance}" field="restaurantName"/>
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.tableName}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.tableName.label" default="tableName"/>
        </div>

        <div class="mcmcdi_info">
            <g:fieldValue bean="${orderInfoInstance}" field="tableName"/>
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.clientId}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.clientId.label" default="User Id"/>
        </div>

        <div class="mcmcdi_info">
            <g:fieldValue bean="${orderInfoInstance}" field="clientId"/>
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.date}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.date.label" default="Date"/>
        </div>

        <div class="mcmcdi_info">
            ${FormatUtil.dateFormat(orderInfoInstance?.date)}
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.time}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.time.label" default="Time"/>
        </div>

        <div class="mcmcdi_info">
            ${FormatUtil.timeFormat(orderInfoInstance?.time)}
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.reserveType}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.reserveType.label" default="Reserve Type"/>
        </div>

        <div class="mcmcdi_info">
            ${ReserveType.getLabel(orderInfoInstance?.reserveType)}
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.status}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.status.label" default="Status"/>
        </div>

        <div class="mcmcdi_info">
            ${OrderStatus.getLable(orderInfoInstance?.status)}
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.valid != null}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.valid.label" default="Valid"/>
        </div>

        <div class="mcmcdi_info">
            ${OrderValid.getLable(orderInfoInstance?.valid)}
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.cancelReason}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.cancelReason.label" default="Cancel Reason"/>
        </div>

        <div class="mcmcdi_info">
            <g:fieldValue bean="${orderInfoInstance}" field="cancelReason"/>
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.addressId}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.addressId.label" default="Address Id"/>
        </div>

        <div class="mcmcdi_info">
            <g:fieldValue bean="${orderInfoInstance}" field="addressId"/>
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.waiterId}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.waiterId.label" default="Waiter Id"/>
        </div>

        <div class="mcmcdi_info">
            <g:fieldValue bean="${orderInfoInstance}" field="waiterId"/>
        </div>
    </div>
</g:if>

%{--<g:if test="${orderInfoInstance?.listenWaiterId}">--}%
    %{--<div class="mcmcd_item">--}%
        %{--<div class="mcmcdi_label">--}%
            %{--<g:message code="orderInfo.listenWaiterId.label" default="Listen Waiter Id"/>--}%
        %{--</div>--}%

        %{--<div class="mcmcdi_info">--}%
            %{--<g:fieldValue bean="${orderInfoInstance}" field="listenWaiterId"/>--}%
        %{--</div>--}%
    %{--</div>--}%
%{--</g:if>--}%

<g:if test="${orderInfoInstance?.cashierId}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.cashierId.label" default="Cashier Id"/>
        </div>

        <div class="mcmcdi_info">
            <g:fieldValue bean="${orderInfoInstance}" field="cashierId"/>
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.remark}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.remark.label" default="Remark"/>
        </div>

        <div class="mcmcdi_info">
            <g:fieldValue bean="${orderInfoInstance}" field="remark"/>
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.numInRestaurant}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.numInRestaurant.label" default="Num In Restaurant"/>
        </div>

        <div class="mcmcdi_info">
            <g:fieldValue bean="${orderInfoInstance}" field="numInRestaurant"/>
        </div>
    </div>
</g:if>

%{--<g:if test="${orderInfoInstance?.orderNum}">--}%
    %{--<div class="mcmcd_item">--}%
        %{--<div class="mcmcdi_label">--}%
            %{--<g:message code="orderInfo.orderNum.label" default="Order Num"/>--}%
        %{--</div>--}%

        %{--<div class="mcmcdi_info">--}%
            %{--<g:fieldValue bean="${orderInfoInstance}" field="orderNum"/>--}%
        %{--</div>--}%
    %{--</div>--}%
%{--</g:if>--}%

<g:if test="${orderInfoInstance?.totalAccount}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.totalAccount.label" default="Total Account"/>
        </div>

        <div class="mcmcdi_info">
            <g:fieldValue bean="${orderInfoInstance}" field="totalAccount"/>
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.postage}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.postage.label" default="Postage"/>
        </div>

        <div class="mcmcdi_info">
            <g:fieldValue bean="${orderInfoInstance}" field="postage"/>
        </div>
    </div>
</g:if>

<g:if test="${orderInfoInstance?.realAccount}">
    <div class="mcmcd_item">
        <div class="mcmcdi_label">
            <g:message code="orderInfo.realAccount.label" default="Real Account"/>
        </div>

        <div class="mcmcdi_info">
            <g:fieldValue bean="${orderInfoInstance}" field="realAccount"/>
        </div>
    </div>
</g:if>

<div class="mcmcd_item" style="width: 900px;">
    <g:customerOrderOperation orderId="${orderInfoInstance?.id}"
                              backUrl="${createLink(controller: "customer", action: "orderShow", params: params, absolute: true)}"></g:customerOrderOperation>
    <a href="${createLink(controller: "customer", action: "orderList")}"
       class="btn btn-link">返回订单列表</a>
</div>

</div>


<div class="mcmc_detail">
    <!--订单对应的点菜信息-->
    <div class="mcmcd_title">
        <div class="mcmcdt_ico"></div>

        <div class="mcmcdt_info">点菜信息</div>
    </div>
    <g:if test="${dishList}">
    %{--<div>--}%
        <table class="table table-striped table-bordered table-condensed">
            <thead>
            <tr>

                <g:sortableColumn property="orderId"
                                  title="${message(code: 'dishesInfo.orderId.label', default: 'Order Id')}"
                                  params="${params}"/>

                <g:sortableColumn property="foodId"
                                  title="${message(code: 'dishesInfo.foodId.label', default: 'Food Id')}"
                                  params="${params}"/>

                <g:sortableColumn property="foodName"
                                  title="${message(code: 'dishesInfo.foodName.label', default: 'Food Name')}"
                                  params="${params}"/>

                <g:sortableColumn property="num" title="${message(code: 'dishesInfo.num.label', default: 'num')}"
                                  params="${params}"/>

                <g:sortableColumn property="status"
                                  title="${message(code: 'dishesInfo.status.label', default: 'Status')}"
                                  params="${params}"/>

                <g:sortableColumn property="valid" title="${message(code: 'dishesInfo.valid.label', default: 'Valid')}"
                                  params="${params}"/>

                %{--<g:sortableColumn property="cancelReason"--}%
                                  %{--title="${message(code: 'dishesInfo.cancelReason.label', default: 'Cancel Reason')}"--}%
                                  %{--params="${params}"/>--}%

                <g:sortableColumn property="remark"
                                  title="${message(code: 'dishesInfo.remark.label', default: 'Remark')}"
                                  params="${params}"/>

                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${dishList}" status="i" var="dishesInfoInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td>${fieldValue(bean: dishesInfoInstance, field: "orderId")}</td>

                    <td>${fieldValue(bean: dishesInfoInstance, field: "foodId")}</td>

                    <td>${fieldValue(bean: dishesInfoInstance, field: "foodName")}</td>

                    <td>${fieldValue(bean: dishesInfoInstance, field: "num")}</td>

                    <td>${DishesStatus.getLable(dishesInfoInstance?.status)}</td>

                    <td>${DishesValid.getLable(dishesInfoInstance?.valid)}</td>

                    %{--<td>${fieldValue(bean: dishesInfoInstance, field: "cancelReason")}</td>--}%

                    <td>${fieldValue(bean: dishesInfoInstance, field: "remark")}</td>

                    <td><g:customerDishesOperation
                            dishesId="${dishesInfoInstance?.id}"></g:customerDishesOperation></td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <white:paginate action="orderShow" total="${totalCount ?: 0}" prev="&larr;" next="&rarr;" params="${params}"/>

    %{--</div>--}%
    </g:if>
    <g:else>
        <div class="mcmcd_item" style="width: 900px;">
            还没有点菜，赶快去点菜吧
        </div>
    </g:else>
</div>


<!--对应的评价信息-->
<g:if test="${appraiseInfoInstance}">
    <div class="mcmc_detail">
        <div class="mcmcd_title">
            <div class="mcmcdt_ico"></div>

            <div class="mcmcdt_info">评价信息</div>
        </div>

        <g:if test="${appraiseInfoInstance?.orderId}">
            <div class="mcmcd_item">
                <div class="mcmcdi_label">
                    <g:message code="appraiseInfo.orderId.label" default="Order Id"/>
                </div>

                <div class="mcmcdi_info">
                    <g:fieldValue bean="${appraiseInfoInstance}" field="orderId"/>
                </div>
            </div>
        </g:if>

        <g:if test="${appraiseInfoInstance?.type>=0}">
            <div class="mcmcd_item">
                <div class="mcmcdi_label">
                    <g:message code="appraiseInfo.type.label"
                               default="Type"/>
                </div>

                <div class="mcmcdi_info">

                    <span class="property-value" aria-labelledby="type-label">${lj.enumCustom.AppraiseType.getLable(appraiseInfoInstance?.type)}</span>

                </div>
            </div>
        </g:if>

        <g:if test="${appraiseInfoInstance?.hygienicQuality}">
            <div class="mcmcd_item"><div class="mcmcdi_label">
                <span id="hygienicQuality-label" class="property-label"><g:message
                        code="appraiseInfo.hygienicQuality.label" default="Hygienic Quality"/></span>
            </div>

                <div class="mcmcdi_info">
                    <span class="property-value" aria-labelledby="hygienicQuality-label"><g:fieldValue
                            bean="${appraiseInfoInstance}" field="hygienicQuality"/></span>

                </div>
            </div>
        </g:if>

        <g:if test="${appraiseInfoInstance?.serviceAttitude}">
            <div class="mcmcd_item"><div class="mcmcdi_label">
                <span id="serviceAttitude-label" class="property-label"><g:message
                        code="appraiseInfo.serviceAttitude.label" default="Service Attitude"/></span>
            </div>

                <div class="mcmcdi_info">
                    <span class="property-value" aria-labelledby="serviceAttitude-label"><g:fieldValue
                            bean="${appraiseInfoInstance}" field="serviceAttitude"/></span>

                </div></div>
        </g:if>

        <g:if test="${appraiseInfoInstance?.deliverySpeed}">
            <div class="mcmcd_item"><div class="mcmcdi_label">
                <span id="deliverySpeed-label" class="property-label"><g:message code="appraiseInfo.deliverySpeed.label"
                                                                                 default="Delivery Speed"/></span>
            </div>

                <div class="mcmcdi_info">
                    <span class="property-value" aria-labelledby="deliverySpeed-label"><g:fieldValue
                            bean="${appraiseInfoInstance}" field="deliverySpeed"/></span>

                </div></div>
        </g:if>

        <g:if test="${appraiseInfoInstance?.taste}">
            <div class="mcmcd_item"><div class="mcmcdi_label">
                <span id="taste-label" class="property-label"><g:message code="appraiseInfo.taste.label"
                                                                         default="Taste"/></span>
            </div>

                <div class="mcmcdi_info">
                    <span class="property-value" aria-labelledby="taste-label"><g:fieldValue
                            bean="${appraiseInfoInstance}"
                            field="taste"/></span>

                </div></div>
        </g:if>

        <g:if test="${appraiseInfoInstance?.whole}">
            <div class="mcmcd_item"><div class="mcmcdi_label">
                <span id="whole-label" class="property-label"><g:message code="appraiseInfo.whole.label"
                                                                         default="Whole"/></span>
            </div>

                <div class="mcmcdi_info">
                    <span class="property-value" aria-labelledby="whole-label"><g:fieldValue
                            bean="${appraiseInfoInstance}"
                            field="whole"/></span>

                </div></div>
        </g:if>

        <g:if test="${appraiseInfoInstance?.appraiseTime}">
            <div class="mcmcd_item"><div class="mcmcdi_label">
                <span id="appraiseTime-label" class="property-label"><g:message code="appraiseInfo.appraiseTime.label"
                                                                                default="Appraise Time"/></span>
            </div>

                <div class="mcmcdi_info">
                    <span class="property-value" aria-labelledby="appraiseTime-label"><g:formatDate
                            date="${appraiseInfoInstance?.appraiseTime}"/></span>

                </div></div>
        </g:if>

        %{--<g:if test="${appraiseInfoInstance?.userId}">--}%
            %{--<div class="mcmcd_item"><div class="mcmcdi_label">--}%
                %{--<span id="userId-label" class="property-label"><g:message code="appraiseInfo.userId.label"--}%
                                                                          %{--default="User Id"/></span>--}%
            %{--</div>--}%

                %{--<div class="mcmcdi_info">--}%
                    %{--<span class="property-value" aria-labelledby="userId-label"><g:fieldValue--}%
                            %{--bean="${appraiseInfoInstance}"--}%
                            %{--field="userId"/></span>--}%

                %{--</div></div>--}%
        %{--</g:if>--}%

        <g:if test="${appraiseInfoInstance?.isAnonymity}">
            <div class="mcmcd_item"><div class="mcmcdi_label">
                <span id="isAnonymity-label" class="property-label"><g:message code="appraiseInfo.isAnonymity.label"
                                                                               default="Is Anonymity"/></span>
            </div>

                <div class="mcmcdi_info">
                    <span class="property-value" aria-labelledby="isAnonymity-label"><g:formatBoolean
                            boolean="${appraiseInfoInstance?.isAnonymity}"/></span>

                </div></div>
        </g:if>

        <g:if test="${appraiseInfoInstance?.restaurantId}">
            <div class="mcmcd_item"><div class="mcmcdi_label">
                <span id="restaurantId-label" class="property-label"><g:message code="appraiseInfo.restaurantId.label"
                                                                                default="Restaurant Id"/></span>
            </div>

                <div class="mcmcdi_info">
                    <span class="property-value" aria-labelledby="restaurantId-label"><g:fieldValue
                            bean="${appraiseInfoInstance}" field="restaurantId"/></span>

                </div></div>
        </g:if>

        %{--<g:if test="${appraiseInfoInstance?.userName}">--}%
            %{--<div class="mcmcd_item"><div class="mcmcdi_label">--}%
                %{--<span id="userName-label" class="property-label"><g:message code="appraiseInfo.userName.label"--}%
                                                                            %{--default="User Name"/></span>--}%
            %{--</div>--}%

                %{--<div class="mcmcdi_info">--}%
                    %{--<span class="property-value" aria-labelledby="userName-label"><g:fieldValue--}%
                            %{--bean="${appraiseInfoInstance}" field="userName"/></span>--}%

                %{--</div></div>--}%
        %{--</g:if>--}%

        <g:if test="${appraiseInfoInstance?.content}">
            <div class="mcmcd_item" style="width: 900px;height: auto;">
                <div class="mcmcdi_label">
                <span id="content-label" class="property-label"><g:message code="appraiseInfo.content.label"
                                                                           default="Content"/></span>
            </div>

                <div class="mcmcdi_info" style="width: auto;height: auto;">
                    <span class="property-value" aria-labelledby="content-label"><g:fieldValue
                            bean="${appraiseInfoInstance}" field="content"/></span>

                </div></div>
        </g:if>

    </div>
</g:if>
</div>
</div>
</body>
</html>
