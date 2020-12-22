import chai from 'chai';
import chaiHttp from 'chai-http';
chai.use(chaiHttp);
const should = chai.should();
const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTksInBob25lIjoiMDM5OTAzNzczNyIsImlhdCI6MTYwODYwODk1MiwiZXhwIjoxNjA4Njk1MzUyfQ.D6gnv-xmPQcFxlISTO-nV9JaLeuHAqT6vyxZuJtYue8'
it('test api register user POST', (done) => {
    chai.request('localhost:3000/api/v1')
        .post('/user/register')
        .send({
            phone: "0399033333",
            email: "picollo@namec.gmail",
            password: "123456",
            first_name: "Pi",
            last_name: "Cô lô",
            roles: []
        })
        .auth(token, {type: "bearer"})
        .end((err, res) => {
            res.should.have.status(200);
            done();
        });
});

it('test api login user POST', (done) => {
    chai.request('localhost:3000/api/v1')
        .post('/user/login')
        .send({
            "phone": "0399037737",
            "password": "123456"
        })
        .end((err, res) => {
            res.should.have.status(200);
            done();
        });
});

it('test api update user PUT', (done) => {
    chai.request('localhost:3000/api/v1')
        .put('/user/update/19')
        .send({
            phone: "0399037737",
            email: "lamln@icheck.vn",
            first_name: "Lưu",
            last_name: "Nhất Lâm",
            age: 24,
            address: "Số 77, xóm mới,nguyên xa, minh khai",
            roles: [5, 6, 7, 8, 9]
        })
        .auth(token, {type: "bearer"})
        .end((err, res) =>{
            res.should.have.status(200);
            done();
        });
});

it ('test api delete user DELTE',  (done) => {
    chai.request('localhost:3000/api/v1')
        .delete('/user/delete/32')
        .auth(token, {type: "bearer"})
        .end((err, res) => {
        res.should.have.status(200);
        done();
    });
})
