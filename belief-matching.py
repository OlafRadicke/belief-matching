import web
from web import form

urls = (
  '/', 'index')

app = web.application(urls, globals())#, web.reloader)
render = web.template.render('templates/')

number_form = form.Form( 
    form.Textbox('number',
                 form.notnull,
                 form.regexp('^-?\d+$', 'Not a number.'),
                 form.Validator('Not greater 10.', lambda x: int(x)>10),
                 description='Enter a number greater 10:'
                 ))

class index:
    def GET(self):
        my_form = number_form()
        return render.index(my_form)

    def POST(self): 
        my_form = number_form() 
        if not my_form.validates(): 
            return render.index(my_form)
        else:
            number = my_form['number'].value
            if int(number) % 2:
                return "Your number %s is odd." % number
            else:
		result = "<link rel=\"stylesheet\" href=\"static/home.css\" type=\"text/css\" media=\"screen\" charset=\"utf-8\"/>"
		result += "Your number " + number  + " is even."
                return result

if __name__ == "__main__":
    app.run()