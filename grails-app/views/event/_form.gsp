<%@ page import="it.resto.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="event.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${eventInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'eventDate', 'error')} ">
	<label for="eventDate">
		<g:message code="event.eventDate.label" default="Event Date" />
		
	</label>
	<g:datePicker name="eventDate" precision="day"  value="${eventInstance?.eventDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="event.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${it.resto.User.list()}" optionKey="id" required="" value="${eventInstance?.owner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'votes', 'error')} ">
	<label for="votes">
		<g:message code="event.votes.label" default="Votes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${eventInstance?.votes?}" var="v">
    <li><g:link controller="vote" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vote" action="create" params="['event.id': eventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vote.label', default: 'Vote')])}</g:link>
</li>
</ul>

</div>

