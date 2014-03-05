<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>it-resto : organisez vos repas!</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

	<!--link rel="stylesheet/less" href="less/bootstrap.less" type="text/css" /-->
	<!--link rel="stylesheet/less" href="less/responsive.less" type="text/css" /-->
	<!--script src="js/less-1.3.3.min.js"></script-->
	<!--append ‘#!watch’ to the browser URL, then refresh the page. -->
	
	<link href="/it-resto/css/bootstrap.min.css" rel="stylesheet">
	<link href="/it-resto/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link href="/it-resto/css/style.css" rel="stylesheet">

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
    <script src="/it-resto/js/html5shiv.js"></script>
  <![endif]-->

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/it-resto/img/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href=/it-resto/img/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href=/it-resto/img/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href=/it-resto/img/apple-touch-icon-57-precomposed.png">
  <link rel="shortcut icon" href=/it-resto/img/favicon.png">
  
	<script type="text/javascript" src="/it-resto/js/jquery.min.js"></script>
	<script type="text/javascript" src="/it-resto/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/it-resto/js/scripts.js"></script>
</head>

<body>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					IT-RESTO <small>organisez vos repas<small>
				</h1>
			</div>
			<a href="/it-resto/event/listEvent" class="btn btn-info btn-xs" type="button">>> Liste des événements</a>
			<a href="/it-resto/event/createEvent" class="btn btn-info btn-xs" type="button">>> Créer un événement</a>
            <g:isAdmin>
			<a href="/it-resto/admin" class="btn btn-info btn-xs" type="button">>> Administration</a>
            </g:isAdmin>
			<a href="/it-resto/event/logout" class="btn btn-info btn-xs" type="button">>> Se déconnecter</a><br/>
            Vous êtes identifié comme : ${session.userLastName} ${session.userName}<br/>

			<div>
				<h2>
					${event.name}
				</h2>
				Proposé par ${event.owner.lastName} ${event.owner.name}, le <g:dateFormat format="dd/MM/yyyy" date="${event.eventDate}"/> à <g:dateFormat format="hh:mm" date="${event.eventDate}"/>
			</div>
			<form id="myForm" name="myForm" method='post' action='voteEvent'>
			<input type="hidden" name="eventId" value="${event.id}"/>
			<input type="hidden" name="isVote" value="true"/>
			<table class="table">
				<thead>
					<tr>
						<th>
							#
						</th>
						<g:each var="restaurant" in="${restaurants}">
						    <th>${restaurant.name}</th>
						</g:each>
					</tr>
				</thead>
				<tbody>
					<g:each var="vote" in="${votes}">
					    <tr><td>${vote.user.lastName} ${vote.user.name}</td>
                        <g:each var="restaurantSelected" in="${vote.listVotesByRestaurants}">
                           <td><img src="/it-resto/images/${restaurantSelected}.png" width="20"></td>
                        </g:each>
                        </tr>
					</g:each>
					<g:if test="${canVote}">
					    <tr><td>${session.userLastName} ${session.userName}</td>
						<g:each var="restaurant" in="${restaurants}">
						    <td><input type="checkbox" name="resto${restaurant.id}" value="${restaurant.id}"/></rd>
						</g:each>
					</g:if>
				</tbody>
			</table>
    		<g:if test="${canVote}">
    			 <a id="modal-354934" href="#modal-container-354934" role="button" class="btn" data-toggle="modal">Voter</a>
			 </g:if>
			</form>

			<div id="modal-container-354934" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<h3 id="myModalLabel">
						Vote pris en compte.
					</h3>
				</div>
				<div class="modal-body">
					<p>
						Votre participation a été prise en compte.
					</p>
				</div>
				<div class="modal-footer">
					 <button class="btn" data-dismiss="modal" aria-hidden="true" onclick="$('#myForm')[0].submit();">Fermer</button>
				</div>
			</div>
			        <div class="span12">
            <center>
                Copyrigth Prod42
            </center>
            </div>

		</div>
	</div>
</div>
</body>
</html>