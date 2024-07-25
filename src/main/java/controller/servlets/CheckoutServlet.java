package controller.servlets;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.database.dbController;
import model.Cart;
import model.OrderDetails;
import model.Orders;

import java.util.Date;
import java.util.List;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");

        System.out.println("UserId from session: " + userId);

        dbController dbController = new dbController();
        List<Cart> cartItems = dbController.getCartItems(userId);

        if (cartItems.isEmpty()) {
            // Handle the case where the cart is empty
            request.setAttribute("errorMessage", "Your cart is empty. Please add items before checking out.");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            return;
        }

        // Calculate the total payable amount
        double totalPayableAmount = calculateTotalAmount(cartItems);

        // Create a new order
        Orders order = new Orders();
        order.setUserId(userId);
        order.setOrderDate(new Date());
        order.setOrderStatus("Pending");
        order.setTotalPayableAmount(totalPayableAmount);

        int orderId = dbController.addOrder(order);

        // Add order details
        for (Cart cartItem : cartItems) {
            OrderDetails orderDetail = new OrderDetails();
            orderDetail.setOrderNo(orderId);
            orderDetail.setProductNo(cartItem.getProductNo());
            orderDetail.setQuantity(cartItem.getQuantity());
            orderDetail.setUnitPrice(cartItem.getUnitPrice());
            orderDetail.setTotalPrice(cartItem.getUnitPrice() * cartItem.getQuantity());
            dbController.addOrderDetail(orderDetail);
        }

        // Clear the user's cart
        dbController.clearCart(userId);

        // Redirect to the order confirmation page or display a success message
        request.setAttribute("successMessage", "Order placed successfully!");
        request.getRequestDispatcher("/Pages/order-placed.jsp").forward(request, response);
    }

    private double calculateTotalAmount(List<Cart> cartItems) {
        double totalAmount = 0;
        for (Cart cartItem : cartItems) {
            totalAmount += cartItem.getUnitPrice() * cartItem.getQuantity();
        }
        return totalAmount;
    }
}