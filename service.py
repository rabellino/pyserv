import cherrypy

class EventCriteria(object):
    @cherrypy.expose
    def request(self):
        return 'hello world'

cherrypy.quickstart(EventCriteria(), '/', "/src/server.conf")