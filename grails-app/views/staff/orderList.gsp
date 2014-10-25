<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-11-20
  Time: 下午11:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="lj.enumCustom.OrderStatus; lj.enumCustom.OrderValid; lj.enumCustom.ReserveType; lj.FormatUtil" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main_template">
    <title>订单列表</title>
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
        height: auto;
        margin: 20px;
        margin-bottom: 0px;
        /*border-bottom: 4px solid #FF9833;
        text-indent: 1em;
        line-height: 80px;
        font-size: 20px;
        font-weight: bolder;*/
    }

    .mcm_content {
        width: 960px;
        height: auto;
        margin: 20px;
    }

    .mcmc_ssl {
        width: 960px;
        margin-top: 10px;
        margin-bottom: 10px;
    }

    .mcmcs_field {
        width: 320px;
        float: left;
    }

    .mcmcsf_input {
        width: 120px;
    }

    .mcmcs_field_middle {
        width: 130px;
        float: left;
    }

    .mcmcsf_input_middle {
        width: 70px;
    }

    .mcmcs_field_small {
        width: 80px;
        float: left;
    }

    .mcmcsf_input_small {
        width: 40px;
    }
    </style>
    <link rel="stylesheet" href="${resource(dir: "js/Datepicker", file: "datepicker.css")}" type="text/css"
          media="screen"/>
    <script type="text/javascript" src="${resource(dir: "js/Datepicker", file: "bootstrap-datepicker.js")}"></script>
    <script type="text/javascript">
        $(function () {
            //日期选择器
            $("#beginDate").datepicker({format: "yyyy-mm-dd"});
            $("#endDate").datepicker({format: "yyyy-mm-dd"});
            $("#beginDateDel").click(function () {
                $("#beginDate").val("");
            });
            $("#endDateDel").click(function () {
                $("#endDate").val("");
            });
        });
    </script>
</head>

<body>

<div class="mc_main">
    <div class="mcm_top">
        <g:render template="../layouts/staffMenu"></g:render>
    </div>
    <div class="mcm_content">
        <!--提示消息-->
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

        <!--搜索条件-->
        <div class="mcmc_ssl">
            <form class="well form-inline" action="${createLink(controller: "staff", action: "orderList")}">

                <div class="mcmcs_field">
                    <label>
                        日期：
                    </label>
                    <div class="input-append">
                        <input style="float: left;" id="beginDate" name="beginDate" type="text"
                               value="${params.beginDate}" class="mcmcsf_input_middle"/>
                        <span class="add-on"><a id="beginDateDel" class="close" href="#" style="float: left;">&times;</a></span>
                    </div>
                        <label style="">&nbsp;-&nbsp;</label>
                    <div class="input-append">
                        <input style="float: left;" id="endDate" name="endDate" type="text"
                               value="${params.endDate}" class="mcmcsf_input_middle"/>
                        <span class="add-on"><a id="endDateDel" class="close" href="#" style="float: left;">&times;</a></span>
                    </div>
                </div>

                <div class="mcmcs_field_middle" style="width: 180px">
                    <label>
                        预定类型：
                    </label>
                    <select name="reserveType" class="mcmcsf_input_middle">
                        <option value="-1" ${params.reserveType == "-1" ? "selected='selected'" : ""}>全部</option>
                        <option value="0" ${params.reserveType == "0" ? "selected='selected'" : ""}>非预定</option>
                        <g:each in="${lj.enumCustom.ReserveType.reserveTypes}">
                            <option value="${it.code}" ${(lj.Number.toInteger(params.reserveType) == it.code) ? "selected='selected'" : ""}>${it.label}</option>
                        </g:each>
                    </select>
                </div>

                <div class="mcmcs_field_middle">
                    <label>
                        有效性：
                    </label>
                    <select name="valid" class="mcmcsf_input_middle">
                        <option value="-1" ${params.status == "-1" ? "selected='selected'" : ""}>全部</option>
                        <g:each in="${lj.enumCustom.OrderValid.valids}">
                            <option value="${it.code}" ${params.valid == it.code.toString() ? "selected='selected'" : ""}>${it.label}</option>
                        </g:each>
                    </select>
                </div>

                <div class="mcmcs_field_middle">
                    <label>
                        状态：
                    </label>
                    <select name="status" class="mcmcsf_input_middle">
                        <option value="-1" ${params.status == "-1" ? "selected='selected'" : ""}>全部</option>
                        <g:each in="${lj.enumCustom.OrderStatus.statuses}">
                            <option value="${it.code}" ${params.status == it.code.toString() ? "selected='selected'" : ""}>${it.label}</option>
                        </g:each>
                    </select>
                </div>

                <div class="ms_field_small">
                    <input type="submit" value="${message(code: 'default.button.search.label', default: 'search')}"
                           class="btn btn-primary"/>


                    <g:actionSubmit value="导出Excel" action="exportOrderList" class="btn btn-primary"/>

                </div>

            </form>
        </div>


        <g:if test="${orderList}">
            <!--订单列表-->
            <table class="table table-striped table-bordered table-condensed">
                <thead>
                <tr>
                    <g:sortableColumn property="id" title="${message(code: 'orderInfo.id.label', default: 'id')}"  params="${params}"/>
                    %{--<g:sortableColumn property="restaurantId"--}%
                                      %{--title="${message(code: 'orderInfo.restaurantId.label', default: 'Restaurant Id')}"/>--}%

                    <g:sortableColumn property="clientId" title="${message(code: 'orderInfo.userName.label', default: 'User Name')}"  params="${params}"/>

                    <g:sortableColumn property="tableId"
                                      title="${message(code: 'orderInfo.tableName.label', default: 'Table Name')}" params="${params}"/>

                    <g:sortableColumn property="date"
                                      title="${message(code: 'orderInfo.date.label', default: 'Date')}" params="${params}"/>

                    <g:sortableColumn property="time"
                                      title="${message(code: 'orderInfo.time.label', default: 'Time')}" params="${params}"/>

                    <g:sortableColumn property="valid" title="${message(code: 'orderInfo.valid.label', default: 'Valid')}" params="${params}"/>

                    <g:sortableColumn property="status" title="${message(code: 'orderInfo.status.label', default: 'Status')}" params="${params}"/>

                    <g:sortableColumn property="reserveType"
                                      title="${message(code: 'orderInfo.reserveType.label', default: 'Reserve Type')}" params="${params}"/>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${orderList}" status="i" var="orderInfoInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                         <td>${orderInfoInstance.id}</td>
                        %{--<td><g:link action="show"--}%
                                    %{--id="${orderInfoInstance.id}">${fieldValue(bean: orderInfoInstance, field: "restaurantId")}</g:link></td>--}%

                        <td>
                        <g:if test="${orderInfoInstance.userName}">
                            ${fieldValue(bean: orderInfoInstance, field: "userName")}
                        </g:if>
                        <g:else>
                            <g:if test="${orderInfoInstance.clientId}">
                                用户&nbsp;${fieldValue(bean: orderInfoInstance, field: "clientId")}
                            </g:if>
                            <g:else>
                                服务员
                            </g:else>
                        </g:else>
                    </td>

                        <td style="max-width: 100px">
                            <g:if test="${orderInfoInstance.tableName}">
                                ${fieldValue(bean: orderInfoInstance, field: "tableName")}
                            </g:if>
                            <g:else>
                                桌位&nbsp;${fieldValue(bean: orderInfoInstance, field: "tableId")}
                            </g:else>
                        </td>

                        <td>${FormatUtil.dateFormat(orderInfoInstance.date)}</td>

                        <td>${FormatUtil.timeFormat(orderInfoInstance.time)}</td>

                        <td>${OrderValid.getLable(orderInfoInstance.valid)}</td>

                        <td>${OrderStatus.getLable(orderInfoInstance.status)}</td>

                        <td>${ReserveType.getLabel(orderInfoInstance.reserveType)}</td>
                        <td>
                            <g:staffOrderOperation orderId="${orderInfoInstance.id}"
                            backUrl="${createLink(controller:"staff",action:  "orderList",params: params,absolute: true)}"></g:staffOrderOperation>
                        </td>
                        <td><a href="${createLink(controller: "staff", action: "orderShow", params: [orderId: orderInfoInstance.id])}">订单详情</a>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <!--分页-->
            <white:paginate action="orderList" total="${totalCount ?: 0}" prev="&larr;" next="&rarr;" params="${params}"/>
        </g:if>
        <g:else>
            <div style="margin: 0px auto;">
                <label style="text-align: center">还没有订单哦</label>
            </div>
        </g:else>
    </div>
</div>
</body>
</html>