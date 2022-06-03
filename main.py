from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from datetime import datetime
import json

#main app variable
app = Flask(__name__)
app.secret_key = 'secret-key'

local_server = True
with open('config.json') as c:
    parameter_json = json.load(c)["params"]

#database setup
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = parameter_json['local_uri']    #database connection
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = parameter_json['prod_uri']
db = SQLAlchemy(app)      #object for SQLAlchemy

#mail module
"""Mail will not work Bescause i have not givon access to the LESS SECURE APP is disablesd"""
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = 465,
    MAIL_USE_SSL = True,
    MAIL_USERNAME = parameter_json['mail_user'],
    MAIL_PASSWORD = parameter_json['mail_pass']
)
mail_var = Mail(app)

#database model
#for contacts
class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(40), nullable=False)
    email = db.Column(db.String(30), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(1000), nullable=False)

#for posts
class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    pimage = db.Column(db.String(30))
    ptitle = db.Column(db.String(50), nullable=False)
    slug = db.Column(db.String(30), nullable=False)
    psubtitle = db.Column(db.String(12), nullable=False)
    pcontent = db.Column(db.String(1000), nullable=False)
    date = db.Column(nullable = True)

@app.route('/dashboard', methods = ['GET', 'POST'])
def login_fun():
    post_dash = Posts.query.all()
    if 'user_var' in session and session['user_var'] == parameter_json['user_admin']:
        return render_template('dashboard.html', post_edit = post_dash)

    if (request.method == 'POST'):
        username = request.form.get('user')
        password = request.form.get('pass')
        if username==parameter_json['user_admin'] and password==parameter_json['pass_admin']:
            session['user_var'] = username
            return render_template('dashboard.html', post_edit = post_dash)


    return render_template('login.html', params=parameter_json)

@app.route('/logout')
def logout_fun():
    session.pop('user_var')
    return redirect('/dashboard')

@app.route('/delete/<string:sno>')
def delete_fun(sno):
    if 'user_var' in session and session['user_var'] == parameter_json['user_admin']:
        post_del = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post_del)
        db.session.commit()

    return redirect('/dashboard')





@app.route('/edit/<string:sno>', methods = ['GET', 'POST'])
def edit_fun(sno):
    if 'user_var' in session and session['user_var'] == parameter_json['user_admin']:
        if request.method == 'POST':
            etitle = request.form.get('title')
            eslug = request.form.get('slug')
            eimage_file = request.form.get('image_file')
            esubtitle = request.form.get('subtitle')
            econtent = request.form.get('content')
            date = datetime.now()

            if sno=='0':
                edit_post = Posts(ptitle = etitle, slug = eslug, pimage = eimage_file, psubtitle = esubtitle, pcontent = econtent, date = date)
                db.session.add(edit_post)
                db.session.commit()

            else:
                post_edit_var = Posts.query.filter_by(sno=sno).first()
                post_edit_var.ptitle = etitle
                post_edit_var.slug = eslug
                post_edit_var.pimage = eimage_file
                post_edit_var.psubtitle = esubtitle
                post_edit_var.pcontent = econtent
                post_edit_var.date = date
                db.session.commit()
                return redirect('/edit/' + sno )
        post_var = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=parameter_json, post = post_var)


@app.route('/')
def home_fun():
    post_home = Posts.query.filter_by().all()[0:parameter_json['no_of_post']]
    return render_template('index.html', params=parameter_json, post_home_temp = post_home)

@app.route('/about')
def about_fun():

    return render_template('about.html', params=parameter_json)



@app.route('/post/<string:post_slug>', methods = ['GET'])
def post_fun(post_slug):
    post_var = Posts.query.filter_by(slug = post_slug).first()
    return render_template('post.html', params=parameter_json, post_template=post_var)


@app.route('/contact', methods=['GET', 'POST'])
def contact_fun():
    if (request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, email=email, phone_num=phone, msg=message)
        db.session.add(entry)
        db.session.commit()
        mail_var.send_message('Mail for Blog' + name,
                              sender = email,
                              recipients = [parameter_json['mail_user']],
                              body = message + "\nPhone Number=" + phone
                              )
    return render_template('contact.html', params=parameter_json)


app.run(debug=True)