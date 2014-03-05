package it.resto.tag

class DateTagLib {
    static defaultEncodeAs = 'html'

    def dateFormat = { attrs, body ->
        if (attrs.date != null) {
            out << new java.text.SimpleDateFormat(attrs.format).format(attrs.date)
        }
        else {
            out << ""
        }
    }

}
