<?php echo $header; ?>
<div class="container">
    <div class="row">
        <div id="content" class="<?php echo $class; ?>"
            <?php if ($categories) { ?>
            <?php if (count($categories) <= 5) { ?>
            <?php } else { ?>
            <div class="row">
                <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
                <div class="col-sm-3">
                    <ul>
                        <?php foreach ($categories as $category) { ?>
                        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                        <?php } ?>
                    </ul>
                </div>
                <?php } ?>
            </div>
            <?php } ?>
            <?php } ?>
            <?php if ($products) { ?>
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-2 text-right">
                    <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
                </div>
                <div class="col-md-3 text-right sort-by">
                    <select id="input-sort" class="form-control" onchange="location = this.value;">
                        <?php foreach ($sorts as $sorts) { ?>
                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select>
                </div>
                <div class="col-md-1 text-right">
                    <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
                </div>
                <div class="col-md-1 text-right sort-by">
                    <select id="input-limit" class="form-control" onchange="location = this.value;">
                        <?php foreach ($limits as $limits) { ?>
                        <?php if ($limits['value'] == $limit) { ?>
                        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <br />
            <div class="row stick-top">

                <table>
                    <thead>
                    <tr>
                        <th>image</th>
                        <th>title</th>
                        <th>description</th>
                        <th>price-new</th>
                        <th>price-old</th>
                        <th>add to cart</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($products as $product) { ?>
                    <tr class="product_row">
                        <td><div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"
                                                                                              title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div></td>
                        <td><h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4></td>
                        <td><p><?php echo $product['description']; ?></p></td>
                        <td><span class="price-new"><?php if($product['special']){ echo $product['special']; } else { echo $product['price']; }?></span></td>
                        <td><span class="price-old"><?php echo $product['price']; ?></span></td>
                        <td>
                            <button type="button" class="wish_list" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                <i class="fa fa-heart"></i></button>
                            <button type="button" class="compare_product" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                <i class="fa fa-exchange"></i></button>
                            <button type="button" class="add_to_cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart">

                                </i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                        </td>
                    </tr>
                    <?php } ?>
                    </tbody>
                </table>

            </div>
            <div class="row">
                <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                <div class="col-sm-6 text-right"><?php echo $results; ?></div>
            </div>
            <?php } ?>
            <?php if (!$categories && !$products) { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="buttons">
                <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
