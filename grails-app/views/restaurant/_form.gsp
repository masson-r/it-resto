<%@ page import="it.resto.Restaurant" %>



<div class="fieldcontain ${hasErrors(bean: restaurantInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="restaurant.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${restaurantInstance?.name}"/>
</div>

