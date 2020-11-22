import {Response} from "express";

const statusCode = {
    SUCCESS: 200,
    FAIL: 400,
    FORBIDDEN: 403,
    Unauthorized: 401,
    InternalServerError: 500
}
export function sendSuccess(data?: any, res?: Response) {
    return res.status(200).json({
        statusCode: statusCode.SUCCESS,
        data: data,
        error: null
    });
}

export function sendBadRequest(res?: Response, message?: string) {
    return res.status(200).json({
        statusCode: statusCode.FAIL,
        data: null,
        error: message
    });
}
export function sendUnauthenticatedRequest(res?: Response) {
    return res.status(401).json({
        statusCode: statusCode.Unauthorized,
        data: null,
        error: 'Unauthorized'
    })
}

export function sendInternalServerErrorRequest(res?: Response) {
    return res.status(500).json({
        statusCode: statusCode.InternalServerError,
        data: null,
        error: 'Server đang bảo trì bạn ơi.'
    })
}

export function sendForbiddenRequest(res?: Response) {
    return res.status(403).json({
        statusCode: statusCode.FORBIDDEN,
        data: null,
        error: 'Bạn không có quyền.'
    })
}

module.exports = {
    sendSuccess,
    sendBadRequest,
    sendUnauthenticatedRequest,
    sendInternalServerErrorRequest,
    sendForbiddenRequest
}