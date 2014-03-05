package it.resto.tag

class AdminTagLib {
    static defaultEncodeAs = 'raw'

    def isAdmin = { attrs, body ->
        if (session.userAdmin) {
            out << body()
        }
        else {
            if (attrs.errorMsg != null) {
                out << attrs.errorMsg
            }
        }
    }
}
