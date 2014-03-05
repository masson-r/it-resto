class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }

		"/"(controller: "Event", action: "listEvent")
		"/admin"(view:"/admin")
//        "/"(view:"/index")
        "500"(view:'/error')
	}
}
