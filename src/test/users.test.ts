import chai from 'chai';
import chaiHttp from 'chai-http';
chai.use(chaiHttp);
var should = chai.should();
const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTksInBob25lIjoiMDM5OTAzNzczNyIsImlhdCI6MTYwODEzMDE0MywiZXhwIjoxNjA4MjE2NTQzfQ.OU8enPxxTWdKOAsTIY7m9HOtIHjXbVkS1KsE6Fc7UIQ'
it('test api register user POST', function(done) {
    chai.request('localhost:3000/api/v1')
        .post('/user/register')
        .send({
            "phone": "016863723119",
            "email": "lamln9@icheck.vn",
            "password": "123456",
            "first_name": "Alex",
            "last_name": "Siri"
        })
        .end(function(err, res){
            res.should.have.status(200);
            done();
        });
});

it('test api login user POST', function(done) {
    chai.request('localhost:3000/api/v1')
        .post('/user/login')
        .send({
            "phone": "0399037737",
            "password": "123456"
        })
        .end(function(err, res){
            res.should.have.status(200);
            done();
        });
});

it('test api update user PUT', function(done) {
    chai.request('localhost:3000/api/v1')
        .put('/user/update/3')
        .send({
            "phone": "0399037737",
            "email": "lamlnUpdated@icheck.vn",
            "first_name": "Lưu Updated",
            "last_name": "Nhất Lâm Updated",
            "age": 24,
            "address": "địa chỉ đã được update"
        })
        .auth(token, {type: "bearer"})
        .end(function(err, res){
            res.should.have.status(200);
            done();
        });
});

it ('test api delete user DELTE', function (done) {
    chai.request('localhost:3000/api/v1')
        .delete('/user/delete/9')
        .auth(token, {type: "bearer"})
        .end(function(err, res){
        res.should.have.status(200);
        done();
    });
})
