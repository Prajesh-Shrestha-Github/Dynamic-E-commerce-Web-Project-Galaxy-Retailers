package model;

import java.util.Date;

public class Orders {
    private int orderNo;
    private int userId;
    private Date orderDate;
    private String orderStatus;
    private double totalPayableAmount;

    public Orders() {
        // Default constructor
    }

    public Orders(int orderNo, int userId, Date orderDate, String orderStatus, double totalPayableAmount) {
        this.orderNo = orderNo;
        this.userId = userId;
        this.orderDate = orderDate;
        this.orderStatus = orderStatus;
        this.totalPayableAmount = totalPayableAmount;
    }

    // Getters and Setters

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public double getTotalPayableAmount() {
        return totalPayableAmount;
    }

    public void setTotalPayableAmount(double totalPayableAmount) {
        this.totalPayableAmount = totalPayableAmount;
    }
}