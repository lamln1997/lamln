"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const chai_1 = __importDefault(require("chai"));
const chai_http_1 = __importDefault(require("chai-http"));
chai_1.default.use(chai_http_1.default);
var should = chai_1.default.should();
const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywicGhvbmUiOiIwMzk5MDM3NzM3IiwiaWF0IjoxNjA1OTczMzkxLCJleHAiOjE2MDYwNTk3OTF9.FPpZ1tL4dCtMGhie-i2Jl7FHIB9SFoErqLnUPi2yFJo';
it('test api register user POST', function (done) {
    chai_1.default.request('localhost:3000/api/v1')
        .post('/users/register')
        .send({
        "phone": "01686372311",
        "email": "lamln@icheck.vn",
        "password": "123456",
        "first_name": "Alex",
        "last_name": "Siri"
    })
        .end(function (err, res) {
        res.should.have.status(200);
        done();
    });
});
it('test api login user POST', function (done) {
    chai_1.default.request('localhost:3000/api/v1')
        .post('/users/login')
        .send({
        "phone": "0399037737",
        "password": "123456"
    })
        .end(function (err, res) {
        res.should.have.status(200);
        done();
    });
});
it('test api update user PUT', function (done) {
    chai_1.default.request('localhost:3000/api/v1')
        .put('/users/update/3')
        .send({
        "phone": "0399037737",
        "email": "lamlnUpdated@icheck.vn",
        "first_name": "Lưu Updated",
        "last_name": "Nhất Lâm Updated",
        "age": 24,
        "address": "địa chỉ đã được update"
    })
        .auth(token, { type: "bearer" })
        .end(function (err, res) {
        res.should.have.status(200);
        done();
    });
});
it('test api delete user DELTE', function (done) {
    chai_1.default.request('localhost:3000/api/v1')
        .delete('/users/delete/9')
        .auth(token, { type: "bearer" })
        .end(function (err, res) {
        res.should.have.status(200);
        done();
    });
});