"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sendForbiddenRequest = exports.sendInternalServerErrorRequest = exports.sendUnauthenticatedRequest = exports.sendBadRequest = exports.sendSuccess = void 0;
const statusCode = {
    SUCCESS: 200,
    FAIL: 400,
    FORBIDDEN: 403,
    Unauthorized: 401,
    InternalServerError: 500
};
function sendSuccess(data, res) {
    return res.status(200).json({
        statusCode: statusCode.SUCCESS,
        data,
        error: null
    });
}
exports.sendSuccess = sendSuccess;
function sendBadRequest(res, message) {
    return res.status(200).json({
        statusCode: statusCode.FAIL,
        data: null,
        error: message
    });
}
exports.sendBadRequest = sendBadRequest;
function sendUnauthenticatedRequest(res) {
    return res.status(401).json({
        statusCode: statusCode.Unauthorized,
        data: null,
        error: 'Unauthorized'
    });
}
exports.sendUnauthenticatedRequest = sendUnauthenticatedRequest;
function sendInternalServerErrorRequest(res) {
    return res.status(500).json({
        statusCode: statusCode.InternalServerError,
        data: null,
        error: 'Server đang bảo trì bạn ơi.'
    });
}
exports.sendInternalServerErrorRequest = sendInternalServerErrorRequest;
function sendForbiddenRequest(res) {
    return res.status(403).json({
        statusCode: statusCode.FORBIDDEN,
        data: null,
        error: 'Bạn không có quyền.'
    });
}
exports.sendForbiddenRequest = sendForbiddenRequest;
module.exports = {
    sendSuccess,
    sendBadRequest,
    sendUnauthenticatedRequest,
    sendInternalServerErrorRequest,
    sendForbiddenRequest
};
