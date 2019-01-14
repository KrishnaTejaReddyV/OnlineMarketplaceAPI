<h1>ROUTES</hi>
<table>
    <tbody>
        <tr>
            <th>Route</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>POST /users</td>
            <td>Creates a new user</td>
        </tr>
        <tr>
            <td>GET /users</td>
            <td>Lists all users</td>
        </tr>
        <tr>
            <td>GET /users?param=value</td>
            <td>Lists the users satisfying the passed query parameter</td>
        </tr>
        <tr>
            <td>GET /users/:id</td>
            <td>Redirects to /users/:id/products from where the users can view and add products to their carts.</td>
        </tr>
        <tr>
            <td>PUT /users/:id</td>
            <td>Edits the details of the user with given id</td>
        </tr>
        <tr>
            <td>DELETE /users/:id</td>
            <td>Deletes the user with given id</td>
        </tr>
        <tr>
            <td>POST /users/:id/products</td>
            <td>Creates a new product</td>
        </tr>
        <tr>
            <td>GET /users/:id/products</td>
            <td>Lists all products</td>
        </tr>
        <tr>
            <td>GET /users/:id/products?param=vaue</td>
            <td>Lists the products satisfying the passed query parameter</td>
        </tr>
        <tr>
            <td>GET /users/:id/products/available</td>
            <td>Lists only the products with non zero inventory count</td>
        </tr>
        <tr>
            <td>GET /users/:id/products/:pid</td>
            <td>Lists the product with given pid</td>
        </tr>
        <tr>
            <td>PUT /users/:id/products/:pid</td>
            <td>Edits the details of the product with given pid</td>
        </tr>
        <tr>
            <td>DELETE /users/:id/products/:pid</td>
            <td>Deletes the product with given pid</td>
        </tr>
        <tr>
            <td>GET /users/:id/products/:pid/addtocart</td>
            <td>Adds the product with given pid to the cart of the user</td>
        </tr>
        <tr>
            <td>GET /users/:id/cart-items</td>
            <td>Lists the items in the cart of the user</td>
        </tr>
        <tr>
            <td>GET /users/:id/cart-items?param=value</td>
            <td>Lists the items in the user cart satisfying the passed query parameter</td>
        </tr>
        <tr>
            <td>GET /users/:id/cart-items/complete</td>
            <td>Purchases the items in the cart</td>
        </tr>
        <tr>
            <td>GET /users/:id/cart-items/:cid</td>
            <td>Lists the cart item with given cid</td>
        </tr>
        <tr>
            <td>GET /users/:id/cart-items/:cid/removefromcart</td>
            <td>Removes the item with given pid from the cart of the user</td>
        </tr>
        <tr>
            <td>GET /users/:id/purchased-items</td>
            <td>Lists all the items purchased by the user</td>
        </tr>
        <tr>
            <td>GET /users/:id/purchased-items?param=value</td>
            <td>Lists the items purchased by the user satisfying the passed query parameter</td>
        </tr>
        <tr>
            <td>GET /users/:id/purchased-items/:puid</td>
            <td>Lists the purchased item with given puid</td>
        </tr>
    </tbody>
</table>
