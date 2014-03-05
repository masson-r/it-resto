package it.resto

class AuthenticateFilters {

    def filters = {
       loginCheck(controller: '*', action: '*') {
           before = {
              if (!session.user && !actionName.equals('login')) {
                  redirect(controller: "Event", action: "login")
                  return false
               }
           }
       }
   } 
}
