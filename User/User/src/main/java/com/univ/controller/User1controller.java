package com.univ.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.univ.entity.UserDtls;
import com.univ.service.CartService;
import com.univ.service.ComplainService;
import com.univ.service.Sellerservice;
import com.univ.service.UserDtlsService;
import com.univ.Repository.UserDtlsRepository;
import com.univ.entity.Cart;
import com.univ.entity.Category;
import com.univ.entity.Complain;
import com.univ.entity.Product;
import com.univ.entity.Seller;

import jakarta.servlet.http.HttpSession;

@Controller
public class User1controller {
	@Autowired
	public UserDtlsService userDtlsService;
	@Autowired
	 private Sellerservice sellerservice;
	
	@Autowired
	private RestTemplate restTemplate;

	@GetMapping("/")
	public String index(Model model, HttpSession session) {
		List<Category> categories = userDtlsService.getCategoriesFromAdmin().stream()
				.sorted((c1, c2) -> c2.getId().compareTo(c1.getId())).limit(6).toList();
		
		session.setAttribute("categories", categories); 
		model.addAttribute("categories", categories);
		
	
	    List<Product> products = userDtlsService.getProductsFromAdmin().stream() 
	    		.sorted((p1, p2) -> p2.getId().compareTo(p1.getId())).limit(8).toList();// ye method create karna hoga
	    model.addAttribute("products", products);
	    
	    List<Product> allProducts = userDtlsService.getProductsFromAdmin();
	    // ⭐⭐ 4. OFFER SECTION — HIGHEST DISCOUNT FIRST ⭐⭐
	    List<Product> offerProducts = allProducts.stream()
	            .filter(p -> p.getDiscount() > 0)        // only products with discount
	            .sorted((p1, p2) -> Integer.compare(p2.getDiscount(), p1.getDiscount())) // highest → lowest
	            .limit(10)                               // show top 10 offers
	            .toList();

	    model.addAttribute("offerProducts", offerProducts);
		return "Index"; // index.jsp
	}
	@GetMapping("exam")
	public String ddd()
	{
	return"exam";	
	}
	 @GetMapping("/service")
     public String service()
     {
    	return"service"; 
     }

	
  @RequestMapping("sel")
	public String Sel()
	{
	return"Seller";
	}
	@RequestMapping("register")
	public String Ragistretion() {
		return "register";
	}
	/*
	 * @RequestMapping("sel") public String Sellar() { return"Sellar"; }
	 */

	@GetMapping("/Login")
	public String showLoginPage(HttpSession session) {

	    // अगर पहले से user login है तो redirect कर दो
	    if (session.getAttribute("user") != null) {
	        return "redirect:/"; // home page
	    }

	    // session से कोई message दिखाना हो तो model में डाल सकते हो
	    Object msg = session.getAttribute("msg");
	    if (msg != null) {
	        session.removeAttribute("msg"); // एक बार दिखा दो
	    }

	    return "Login"; // login.jsp
	}
	@RequestMapping("Das")
	public String Dasbord() {
		return "Dasbord";
	}
	// ALL PRODUCTS (with category filter + selected product view)
	/*
	 * @GetMapping("/products") public String allProducts(@RequestParam(required =
	 * false) String category,
	 * 
	 * @RequestParam(required = false) Integer id, Model model) {
	 * 
	 * // Categories List<Category> categories =
	 * userDtlsService.getCategoriesFromAdmin(); model.addAttribute("categories",
	 * categories);
	 * 
	 * // All Products List<Product> allProducts =
	 * userDtlsService.getProductsFromAdmin();
	 * 
	 * // CATEGORY FILTER if (category != null && !category.isEmpty()) {
	 * 
	 * // Category products first List<Product> categoryProducts =
	 * allProducts.stream() .filter(p -> p.getCategory().equalsIgnoreCase(category))
	 * .toList();
	 * 
	 * // Other products after that List<Product> otherProducts =
	 * allProducts.stream() .filter(p ->
	 * !p.getCategory().equalsIgnoreCase(category)) .toList();
	 * 
	 * // Merge list allProducts = new java.util.ArrayList<>();
	 * allProducts.addAll(categoryProducts); allProducts.addAll(otherProducts);
	 * 
	 * model.addAttribute("selectedCategory", category); }
	 * 
	 * // SELECTED PRODUCT VIEW if (id != null) { Product product =
	 * userDtlsService.getProductById(id); model.addAttribute("selectedProduct",
	 * product); List<Product> offerProducts = allProducts.stream() .filter(p ->
	 * p.getDiscount() > 0) // only products with discount .sorted((p1, p2) ->
	 * Integer.compare(p2.getDiscount(), p1.getDiscount())) // highest → lowest
	 * .limit(10) // show top 10 offers .toList();
	 * 
	 * model.addAttribute("offerProducts", offerProducts);
	 * 
	 * } model.addAttribute("offerProducts", allProducts); //
	 * model.addAttribute("offerProducts", allProducts(null, null, null));
	 * model.addAttribute("products", allProducts);
	 * 
	 * return "product"; // product.jsp }
	 */	
	@GetMapping("/products")
	public String allProducts(
	        @RequestParam(required = false) String category,
	        @RequestParam(required = false) Integer id,
	        @RequestParam(value = "search", required = false) String search,
	      	        Model model) {
		System.out.println("Search keyword = " + search);
	    // 1. Load categories
	    List<Category> categories = userDtlsService.getCategoriesFromAdmin();
	    model.addAttribute("categories", categories);
        ///
	    
	    // 2. Load all products
	    List<Product> allProducts = userDtlsService.getProductsFromAdmin();

	    // 3. CATEGORY FILTER (your requirement)
	    if (category != null && !category.isEmpty()) {

	        List<Product> categoryProducts = allProducts.stream()
	                .filter(p -> p.getCategory() != null &&
	                             p.getCategory().equalsIgnoreCase(category))
	                .toList();

	        List<Product> otherProducts = allProducts.stream()
	                .filter(p -> p.getCategory() == null ||
	                            !p.getCategory().equalsIgnoreCase(category))
	                .toList();

	        allProducts = new ArrayList<>();
	        allProducts.addAll(categoryProducts);  // Selected category first
	        allProducts.addAll(otherProducts);    // Other products next
	         // OTHER PRODUCTS BELOW

	        model.addAttribute("selectedCategory", category);
	    }
	    if (search != null && !search.trim().isEmpty()) {

	        String keyword = search.toLowerCase();

	        allProducts = allProducts.stream()
	                .filter(p ->
	                    (p.getTitle() != null && p.getTitle().toLowerCase().contains(keyword)) ||
	                    (p.getCategory() != null && p.getCategory().toLowerCase().contains(keyword)) ||
	                    (p.getDescription() != null && p.getDescription().toLowerCase().contains(keyword))
	                )
	                .toList();

	        model.addAttribute("search", search);
	    }

	    // 4. Selected product details
	    if (id != null) {
	        Product product = userDtlsService.getProductById(id);
	        model.addAttribute("selectedProduct", product);
	    }

	    // Offer products (Top 10 discounted)
	    List<Product> offerProducts = userDtlsService.getProductsFromAdmin()
	            .stream()
	            .filter(p -> p.getDiscount() > 0)
	            .sorted((p1, p2) -> Integer.compare(p2.getDiscount(), p1.getDiscount()))
	            .limit(10)
	            .toList();

	    model.addAttribute("offerProducts", offerProducts);

	    // 5. Final product list (after category sorting)
	    model.addAttribute("products", allProducts);

	    return "product";   // product.jsp
	}

		///////////////////////////////////////////////////////////////////////////////////
	// registter
	/*
	 * @PostMapping("saveUser") public String Register(@ModelAttribute UserDtls
	 * User, @RequestParam("img") MultipartFile file, HttpSession session) throws
	 * IOException { Boolean existsEmail =
	 * userDtlsService.existsEmail(User.getEmail()); if (existsEmail) {
	 * session.setAttribute("errorMsg", "Email already exist"); } else { String
	 * imageName = file.isEmpty() ? "default.jpg" : file.getOriginalFilename();
	 * User.setProfileImage(imageName);
	 * 
	 * UserDtls saveUser = userDtlsService.saveUserDtls(User);
	 * 
	 * if (!ObjectUtils.isEmpty(saveUser)) { if (!file.isEmpty()) { String uploadDir
	 * =
	 * "C:\\ProjectWebccg\\User1\\User1\\src\\main\\webapp\\assets\\img\\profile_img";
	 * 
	 * Path path = Paths.get(uploadDir, file.getOriginalFilename()); //
	 * System.out.println(path); Files.copy(file.getInputStream(), path,
	 * StandardCopyOption.REPLACE_EXISTING); // Files.copy(file.getInputStream(),
	 * path, StandardCopyOption.REPLACE_EXISTING);
	 * 
	 * } session.setAttribute("succMsg", "Register successfully"); }
	 * 
	 * else { session.setAttribute("errorMsg", "something wrong on server"); }
	 * 
	 * }
	 * 
	 * return "redirect:/Login"; }
	 */
	
	
	////////////////////////////////////////////
	
	/*
	 * @Controller public class UserController {
	 */

		/*
		 * @Autowired private UserRepository userRepo
		 */;

		@PostMapping("/saveUser")
		public String registerUser(@ModelAttribute UserDtls user,
		                           @RequestParam("img") MultipartFile file,
		                           HttpSession session) {

			try {
				// Password encryption (optional)
				// user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));

				String role = user.getRole();
				userDtlsService.existsEmail(user.getEmail());
				if ("USER".equalsIgnoreCase(role)) {
					user.setIsEnable(true); // direct enable for user
				} else if ("SELLER".equalsIgnoreCase(role)) {
					user.setIsEnable(false); // seller needs admin approval
				}

				// Save user image (optional)
				if (!file.isEmpty()) {
					/* user.setProfileImage(file.getOriginalFilename()); */
					if (!file.isEmpty()) {
					    String uploadDir = "C:\\ProjectWebccg\\User1\\User1\\src\\main\\webapp\\assets\\img\\profile_img";
					    Path path = Paths.get(uploadDir, file.getOriginalFilename());
					    Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					}
					// file transfer logic here
				}

				/*
				 * UserDtlsService service = new UserDtlsService(); service.save(user);
				 */
				userDtlsService.save(user);

				if ("USER".equalsIgnoreCase(role)) {
					session.setAttribute("msg", "User registered successfully! Please login.");
					return "redirect:/Login";
				} else if ("SELLER".equalsIgnoreCase(role)) {
					session.setAttribute("msg", "Seller registration sent for admin approval!");
					return "redirect:/pendingApproval";
				}

			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("msg", "Error occurred during registration.");
			}
			return "redirect:/register";
		}
	
		/*
		 * @PostMapping("/loginUser") public String loginUser(@RequestParam String
		 * email,
		 * 
		 * @RequestParam String password, HttpSession session) {
		 * 
		 * UserDtls user = userDtlsService.findByEmail(email);
		 * 
		 * 
		 * if (user == null || !user.getPassword().equals(password)) {
		 * session.setAttribute("msg", "Invalid email or password!"); }
		 * 
		 * if (!user.getIsEnable()) { session.setAttribute("msg",
		 * "Account not active. Wait for admin approval!"); }
		 * 
		 * 
		 * session.setAttribute("user", user);
		 * 
		 * switch (user.getRole().toUpperCase()) {
		 * 
		 * case "ADMIN": return "redirect://localhost:8080/index"; case "SELLER": return
		 * "redirect://localhost:8082/index"; default: return "redirect:Index";
		 * 
		 * 
		 * }
		 * 
		 * }
		 */
		
	    @PostMapping("/loginUser")
		public String loginUser(@RequestParam String email,
		                        @RequestParam String password,
		                        HttpSession session) {

		    UserDtls user = userDtlsService.findByEmail(email);
            System.out.println(user);
            
		    
		    if (user == null) {
		        session.setAttribute("msg", "Invalid email!");
		        return "redirect:/Login";
		    }

		    // PASSWORD CHECK
		    if (!user.getPassword().equals(password)) {
		        session.setAttribute("msg", "Wrong password!");
		        return "redirect:/Login";
		    }

		    // ENABLE CHECK
		    if (!user.getIsEnable()) {
		        session.setAttribute("msg", "Account not active. Wait for admin approval.");
		        return "redirect:/Login";
		    }

		    // ✅ LOGIN SUCCESS → SAVE USER IN SESSION
		    session.setAttribute("user", user);
		    System.out.println("final"+user);

		    // LOGIN SUCCESS → HOME PAGE
		    return "redirect:/";		   

	    }
		    
		
//////////////////////////////////////////////offer//////////////                        ()
		
	    @GetMapping("/offers")
		public String Discount(Model model) {

		    // ⭐ 1. All products DB se lao
		    List<Product> allProducts =  userDtlsService.getProductsFromAdmin();

		    // ⭐ 2. Filter → only products where discount > 0
		    List<Product> offerProducts = allProducts.stream()
		            .filter(p -> p.getDiscount() > 0)
		            .sorted((p1, p2) -> Integer.compare(p2.getDiscount(), p1.getDiscount())) // high → low
					/*
					 * .limit(10) // Top 10 offers
					 */		 
		            .toList();

		    // ⭐ 3. JSP me bhejna
		    model.addAttribute("offerProducts", offerProducts);

		    // ⭐ 4. return JSP page
		    return "offers";  // offers.jsp
		}
		
		@GetMapping("/view")
		public String view(@RequestParam int id,
		                   Model model) {
          
		    // ✅ Selected product fetch
		    Product products = userDtlsService.getProductById(id);
		    model.addAttribute("product", products);

		    return "view";  // view.jsp
		}
		
		
		
		///////////////////////////////////////////////////add to Cart////////////////////////
		@Autowired
		private CartService cartService;
		@GetMapping("/cart")
		public String viewCart(HttpSession session, Model model) {

		    // 👉 Session से logged-in user को निकालो
		    UserDtls user = (UserDtls) session.getAttribute("user");
		    System.out.println("Logged User: " + user);

		    // 👉 अगर लॉगिन नहीं है तो Login page पर redirect करो
		    if (user == null) {
		        return "redirect:/Login";
		    }

		    // 👉 Logged-in user के cart items DB से निकालो
		    List<Cart> items = cartService.getCartItems(user.getId());

		    // 👉 Data को JSP में भेजो
		   
		   // model.addAttribute("user", user);
		    model.addAttribute("cartItems", items);

		    // 👉 cart.jsp खोलेगा
		    return "cart";
		}

		/*
		 * @PostMapping("/cart/add")
		 * 
		 * @ResponseBody public Map<String,Object> addToCart(@RequestBody
		 * Map<String,Object> data, HttpSession session){
		 * 
		 * Map<String,Object> res = new HashMap<>();
		 * 
		 * UserDtls user = (UserDtls) session.getAttribute("user");
		 * 
		 * if(user == null){ res.put("success", false);
		 * res.put("msg","Please login first!"); return res; }
		 * 
		 * Integer pid = Integer.parseInt(data.get("productId").toString()); Integer qty
		 * = Integer.parseInt(data.get("quantity").toString());
		 * 
		 * cartService.addProductToCart(user.getId(), pid, qty);
		 * 
		 * res.put("success", true);
		 * 
		 * return res; }
		 */	
	    @PostMapping("/cart/add")
	    @ResponseBody
	    public Map<String, Object> addToCart(@RequestBody Map<String, Object> data,
	                                         HttpSession session) {
	        
	        Map<String, Object> res = new HashMap<>();
	        
	        UserDtls user = (UserDtls) session.getAttribute("user");
	        
	        if (user == null) {
	            res.put("success", false);
	            res.put("msg", "Please login first!");
	            return res;
	        }
	        
	        try {
	            Integer pid = Integer.parseInt(data.get("productId").toString());
	            Integer qty = Integer.parseInt(data.get("quantity").toString());
	            
	            // Add product to cart
	            cartService.addProductToCart(user.getId(), pid, qty);
	            
	            // Get updated cart count
	            int cartCount = cartService.getCartCount(user.getId());
	            
	            res.put("success", true);
	            res.put("cartCount", cartCount);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            res.put("success", false);
	            res.put("msg", "Error adding to cart");
	        }
	        
	        return res;
	    }
	    
	    @PostMapping("/update-qty")
	    @ResponseBody
	    public Map<String, Object> updateCartQty(@RequestBody Map<String, Object> data,
	                                             HttpSession session) {
	        
	        Map<String, Object> res = new HashMap<>();
	        
	        UserDtls user = (UserDtls) session.getAttribute("user");
	        
	        if (user == null) {
	            res.put("success", false);
	            res.put("message", "Please login first");
	            return res;
	        }
	        
	        try {
	            Integer cartId = Integer.parseInt(data.get("cartId").toString());
	            Integer quantity = Integer.parseInt(data.get("quantity").toString());
	            
	            System.out.println("Updating cart: ID=" + cartId + ", Qty=" + quantity);
	            
	            // Update quantity
	            Cart updatedCart = cartService.updateQuantity(cartId, quantity);
	            
	            if (updatedCart == null) {
	                res.put("success", false);
	                res.put("message", "Item not found in cart");
	                return res;
	            }
	            
	            // Get updated totals
	            Double grandTotal = cartService.getGrandTotal(user.getId());
	            
	            res.put("success", true);
	            res.put("itemTotal", updatedCart.getTotalPrice());
	            res.put("grandTotal", grandTotal);
	            
	            System.out.println("Updated successfully. Item Total: " + updatedCart.getTotalPrice() 
	                             + ", Grand Total: " + grandTotal);
	            
	        } catch (NumberFormatException e) {
	            res.put("success", false);
	            res.put("message", "Invalid data format");
	            e.printStackTrace();
	        } catch (Exception e) {
	            res.put("success", false);
	            res.put("message", "Error updating cart");
	            e.printStackTrace();
	        }
	        
	        return res;
	    }
	    
	    @PostMapping("/remove")
	    @ResponseBody
	    public Map<String, Object> removeFromCart(@RequestBody Map<String, Object> data,
	                                              HttpSession session) {
	        
	        Map<String, Object> res = new HashMap<>();
	        
	        UserDtls user = (UserDtls) session.getAttribute("user");
	        
	        if (user == null) {
	            res.put("success", false);
	            res.put("message", "Please login first");
	            return res;
	        }
	        
	        try {
	            Integer cartId = Integer.parseInt(data.get("cartId").toString());
	            
	            // Remove item from cart
	            boolean removed = cartService.removeFromCart(cartId);
	            
	            if (removed) {
	                // Get updated totals
	                Double grandTotal = cartService.getGrandTotal(user.getId());
	                int cartCount = cartService.getCartCount(user.getId());
	                
	                res.put("success", true);
	                res.put("grandTotal", grandTotal);
	                res.put("cartCount", cartCount);
	            } else {
	                res.put("success", false);
	                res.put("message", "Item not found");
	            }
	            
	        } catch (Exception e) {
	            res.put("success", false);
	            res.put("message", "Error removing item");
	            e.printStackTrace();
	        }
	        
	        return res;
	    }
	    
	    @GetMapping("/count")
	    @ResponseBody
	    public Map<String, Object> getCartCount(HttpSession session) {
	        
	        Map<String, Object> res = new HashMap<>();
	        
	        UserDtls user = (UserDtls) session.getAttribute("user");
	        
	        if (user == null) {
	            res.put("count", 0);
	            return res;
	        }
	        
	        int cartCount = cartService.getCartCount(user.getId());
	        res.put("count", cartCount);
	        
	        return res;
	    }
	    
	    @PostMapping("/clear")
	    @ResponseBody
	    public Map<String, Object> clearCart(HttpSession session) {
	        
	        Map<String, Object> res = new HashMap<>();
	        
	        UserDtls user = (UserDtls) session.getAttribute("user");
	        
	        if (user == null) {
	            res.put("success", false);
	            res.put("message", "Please login first");
	            return res;
	        }
	        
	        try {
	            cartService.clearCart(user.getId());
	            res.put("success", true);
	            res.put("message", "Cart cleared successfully");
	        } catch (Exception e) {
	            res.put("success", false);
	            res.put("message", "Error clearing cart");
	            e.printStackTrace();
	        }
	        
	        return res;
	    }
	

		//////////////////////////////////////////////////////////////////////////////
     @GetMapping("/chackout")
	 public String chackout()
	 {
		return "chackout"; 
	 }
     @GetMapping("/order")
     public String order()
     {
    	 return"Order";
     }
     
     @GetMapping("/profile")
     public String profile()
     {
    	return"profile"; 
     }
     @GetMapping("/complain")
     public String complain(@RequestParam("orderId") Integer orderId,
                            HttpSession session,
                            Model model) {

         UserDtls user = (UserDtls) session.getAttribute("user");
         if (user == null) {
             return "redirect:/Login";
         }

         model.addAttribute("orderId", orderId);
         return "Complain";   // Complain.jsp
     }     
     
     @Autowired
     private ComplainService complainService;
     @PostMapping("/saveComplaint")
     public String saveComplaint(
             @RequestParam("orderId") Integer orderId,
             @RequestParam("subject") String subject,
             @RequestParam("message") String message,
             HttpSession session,
             RedirectAttributes redirectAttributes) {

         // ✅ Logged-in user (session se)
         UserDtls user = (UserDtls) session.getAttribute("user");

         if (user == null) {
             redirectAttributes.addFlashAttribute("errorMsg", "Please login first!");
             return "redirect:/Login";
         }
        

         Complain complain = new Complain();
         complain.setUser(user);
         complain.setOrderId(orderId);
         complain.setSubject(subject);
         complain.setMessage(message);
         complain.setStatus("PENDING");
         complain.setCreatedAt(LocalDateTime.now());

         complainService.saveComplaint(complain);

         redirectAttributes.addFlashAttribute(
                 "successMsg", "Complaint submitted successfully!");

         return "redirect:/complain";
     }
    
  	}
	
		






















































































































