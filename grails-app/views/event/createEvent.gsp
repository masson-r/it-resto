<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>it-resto : organisez vos repas!</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

	<!--link rel="stylesheet/less" href="/it-resto/less/bootstrap.less" type="text/css" /-->
	<!--link rel="stylesheet/less" href="/it-resto/less/responsive.less" type="text/css" /-->
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
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/it-resto/images/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/it-resto/images/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/it-resto/images/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="/it-resto/images/apple-touch-icon-57-precomposed.png">
  <link rel="shortcut icon" href="/it-resto/images/favicon.png">

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
					IT-RESTO <small>organisez vos repas</small>
				</h1>
			</div>
			<a href="/it-resto/event/listEvent" class="btn btn-info btn-xs" type="button">>> Liste des événements</a>
            <g:isAdmin>
			<a href="/it-resto/admin" class="btn btn-info btn-xs" type="button">>> Administration</a>
            </g:isAdmin>
			<a href="/it-resto/event/logout" class="btn btn-info btn-xs" type="button">>> Se déconnecter</a><br/>
            Vous êtes identifié comme : ${session.userLastName} ${session.userName}<br/>


				<h2>Création d'un evenement</h2>

			<form id="myForm" name="myForm" method='post' action='createEvent'>
				<fieldset>
					 <legend>Nom</legend> <label>Nom</label><input type="text" name="name">
					 <legend>Date de l'évévement</legend> <label>Date</label><input type="datetime-local" name="dateEvent">
				</fieldset>
			</form>
			<a id="modal-354934" href="#modal-container-354934" role="button" class="btn" data-toggle="modal">Créer</a>

			<div id="modal-container-354934" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<h3 id="myModalLabel">
						Evénement créé.
					</h3>
				</div>
				<div class="modal-body">
					<p>
						Votre événement a été créé.
					</p>
				</div>
				<div class="modal-footer">
					 <button class="btn" data-dismiss="modal" aria-hidden="true" onclick="$('#myForm')[0].submit()">Fermer</button>
				</div>
			</div>

		</div>
		        <div class="span12">
                    <center>
                       Copyrigth Prod42
                    </center>
                </div>
	</div>
</div>
</body>
</html>
