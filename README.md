RESOURCES
The API offers the following four resources:

Resource	                    Description
/users	                        Provides list of all users
/users/:id/products	            Provides list of all products
/users/:id/cart-items	        Provides items in user’s cart
/users/:id/purchased-items	    Provides items purchased by the user

ROUTES
Following are the allowed routes:

HTTP Method	    Route	                                        Description
POST	        /users	                                        Creates a new user
GET	            /users	                                        Lists all users
GET	            /users?param=value	                            Lists the users satisfying the passed query parameter
GET	            /users/:id	                                    Redirects to /users/:id/products from where the users can view and add products to their carts.
PUT	            /users/:id	                                    Edits the details of the user with given id
DELETE	        /users/:id	                                    Deletes the user with given id
POST	        /users/:id/products	                            Creates a new product
GET	            /users/:id/products	                            Lists all products
GET	            /users/:id/products?param=value	                Lists the products satisfying the passed query parameter
GET	            /users/:id/products/available	                Lists only the products with non zero inventory count
GET	            /users/:id/products/:pid	                    Lists the product with given pid
PUT	            /users/:id/products/:pid	                    Edits the details of the product with given pid
DELETE	        /users/:id/products/:pid	                    Deletes the product with given pid
GET	            /users/:id/products/:pid/addtocart	            Adds the product with given pid to the cart of the user
GET	            /users/:id/cart-items	                        Lists the items in the cart of the user
GET	            /users/:id/cart-items?param=value	            Lists the items in the cart satisfying the passed query parameter
GET	            /users/:id/cart-items/complete	                Purchases the items in the cart
GET	            /users/:id/cart-items/:cid	                    Lists the cart item with given cid
GET	            /users/:id/cart-items/:cid/removefromcart	    Removes the item with given pid from the cart of the user
GET	            /users/:id/purchased-items	                    Lists all the items purchased by the user
GET	            /users/:id/purchased-items?param=value	        Lists the items purchased by the user satisfying the passed query parameter
GET	            /users/:id/purchased-items/:puid	            Lists the purchased item with given puid
