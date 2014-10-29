<%@ page import="lj.data.FoodClassInfo" %>
<!DOCTYPE html>
<html>
	<head>
        <meta name="layout" content="main_template"/>
		<g:set var="entityName" value="${message(code: 'foodClassInfo.label', default: 'foodClassInfo')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>

	<body>

    <g:render template="../layouts/shopMenu"/>

    <div id="create-foodClassInfo" class="content scaffold-create" role="main" style="width: 800px;">
        <h1 style="margin: 9px 0px 9px 40px;" class="breadcrumb"><g:message code="default.create.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="tips tips-small tips-info" style="margin: 9px 0px 9px 40px;">
                <span class="x-icon x-icon-small x-icon-error"><i class="icon icon-white icon-bell"></i></span>
                <div class="tips-content">
                    ${flash.message}
                </div>
            </div>
        </g:if>
        <g:hasErrors bean="${foodClassInfoInstance}">
            <div class="tips tips-small tips-warning" style="margin: 9px 0px 9px 40px;">
                <span class="x-icon x-icon-small x-icon-error"><i class="icon icon-white icon-bell"></i></span>
                <div class="tips-content">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${foodClassInfoInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </div>
        </g:hasErrors>
        <g:form action="save" class="form-horizontal well" style="margin: 9px 0px 9px 40px;"  >

            <g:render template="form"/>

            <div class="row">
                <div class="form-actions offset3">
                    <g:submitButton name="create" class="button button-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </div>
            </div>
        </g:form>
    </div>
	</body>
</html>
