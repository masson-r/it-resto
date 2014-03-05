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
					IT-RESTO <small>organisez vos repas<small>
				</h1>
			</div>
			<a href="/it-resto/event/createEvent" class="btn btn-info btn-xs" type="button">>> Créer un événement</a>
            <g:isAdmin>
			<a href="/it-resto/admin" class="btn btn-info btn-xs" type="button">>> Administration</a>
            </g:isAdmin>
			<a href="/it-resto/event/logout" class="btn btn-info btn-xs" type="button">>> Se déconnecter</a><br/>
            Vous êtes identifié comme : ${session.userLastName} ${session.userName}<br/>
			<div class="carousel slide" id="carousel-98871">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-98871">
					</li>
					<li data-slide-to="1" data-target="#carousel-98871">
					</li>
					<li data-slide-to="2" data-target="#carousel-98871">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="/it-resto/images/KingCroissant.png">
						<div class="carousel-caption">
							<h4>
								King Croissant
							</h4>
							<p>
								Facile, frais, rapide, chaud, pratique et prêt à emporter.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="/it-resto/images/MacBoucane.png">
						<div class="carousel-caption">
							<h4>
								Mak Boucané
							</h4>
							<p>
								La cuisine des Caraïbes n'aura bientôt plus de secret pour vous après un repas au restaurant Mak Boucané.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="/it-resto/images/LittleItaly.png">
						<div class="carousel-caption">
							<h4>
								Little Italy
							</h4>
							<p>
								De la chaleur de nos équipes en passant par toute la palette des saveurs et des couleurs de l'Italie, tout est réuni ici, pour votre plaisir
							</p>
						</div>
					</div>
				</div> <a data-slide="prev" href="#carousel-98871" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-98871" class="right carousel-control">›</a>
			</div>
		</div>
        <div class="span12">
                <h2>Liste des événements en cours</h2>
                <ul style="font-size: 100%">
                        <g:each var="event" in="${events}">
                            <li><a href="/it-resto/event/voteEvent?eventId=${event.id}">${event.name}</a>, proposé par ${event.owner.name} (le <g:dateFormat format="dd/MM/yyyy" date="${event.eventDate}"/> à <g:dateFormat format="hh:mm" date="${event.eventDate}"/>)</li>
                        </g:each>
                </ul>
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

