package com.univ.entity;

import java.time.LocalDateTime;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "complain") // Table name explicitly set
public class Complain {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    // Many complaints can belong to one user
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false) // Foreign key
    private UserDtls user;

    @Column(name = "order_id")
    private Integer orderId;

    private String subject;

    @Column(length = 1000)
    private String message;

    private String status; // e.g., PENDING, IN_PROGRESS, RESOLVED

    @Column(name = "created_at", columnDefinition = "DATETIME") // MySQL 5.x friendly
    private LocalDateTime createdAt;

    // No-arg constructor required by Hibernate
    public Complain() {}

    // All-args constructor
    public Complain(Integer id, UserDtls user, Integer orderId,
                    String subject, String message,
                    String status, LocalDateTime createdAt) {
        this.id = id;
        this.user = user;
        this.orderId = orderId;
        this.subject = subject;
        this.message = message;
        this.status = status;
        this.createdAt = createdAt;
    }

    // Getters & Setters
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public UserDtls getUser() { return user; }
    public void setUser(UserDtls user) { this.user = user; }

    public Integer getOrderId() { return orderId; }
    public void setOrderId(Integer orderId) { this.orderId = orderId; }

    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    @Override
    public String toString() {
        return "Complain [id=" + id + ", user=" + user +
               ", orderId=" + orderId + ", subject=" + subject +
               ", message=" + message + ", status=" + status +
               ", createdAt=" + createdAt + "]";
    }
}
