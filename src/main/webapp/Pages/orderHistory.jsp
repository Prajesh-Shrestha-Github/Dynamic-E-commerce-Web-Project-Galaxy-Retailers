<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order History</title>
    <!-- Add any CSS or styling links here -->
</head>
<body>
    <h1>Order History</h1>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Date</th>
            <th>Status</th>
            <th>Total Payable Amount</th>
        </tr>
        <c:forEach var="order" items="${orderHistory}">
            <tr>
                <td>${order.orderId}</td>
                <td>${order.orderDate}</td>
                <td>${order.orderStatus}</td>
                <td>${order.totalPayableAmount}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
