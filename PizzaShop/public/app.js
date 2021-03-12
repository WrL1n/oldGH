// Добавление пицц в корзину (по шт.)
function add_to_cart(id)
{
	var key = 'product_' + id;
	
	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;

	window.localStorage.setItem(key, x);

	sum_product()
	update_orders_button()
	update_orders_input();
}

// удаление пицц из карзины (по шт.)
function remove_from_cart(id)
{
	var key = 'product_' + id;
	
	var x = window.localStorage.getItem(key);
	if (x <= 1) {

		window.localStorage.removeItem(key);

	} else {
		x = x * 1 - 1;

		window.localStorage.setItem(key, x);		
	}

	sum_product()
	update_orders_button()
	update_orders_input()
}

// Сумма всех продуктов (в единицах)
function sum_product()
{
	var sum_product = 'sum_product'
	var sum_p = 0

	for (var i = 0; i <= localStorage.length; i++){
	    var key = 'product_' + (i+1);
	    var x = window.localStorage.getItem(key);
	    sum_p = sum_p * 1 + x * 1;
	}
	window.localStorage.setItem(sum_product, sum_p);
}

// Вывод в формате product_1 = 23 и т.д. в hidden поле, для последнующй отправки на сервер
function cart_get_orders()
{
	var orders = '';

	for(var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i)
		var value = window.localStorage.getItem(key)

		if (key.indexOf('product_') == 0)
		{
			orders = orders + key + '=' + value + ',';
		}	
	}	
	return orders;
}

// Автомат. заполнения hidden поля, если оно не пусто
function update_orders_input()
{
	var orders = cart_get_orders();
	$('#orders_input').val(orders);
}

// Лайв показ кол-ва товаров на кнопке (в ед.)
function update_orders_button()
{
	var text = 'Cart (' + window.localStorage.getItem("sum_product") + ')';
	$('#orders_button').val(text);
}

function show_orders_input()
{
	var orders = cart_get_orders();
	$('#orders_show').val(orders);
}

function cancel_order()
{
	window.localStorage.clear();

	update_orders_input();
	update_orders_button();

	$('#cart').text('Your cart is now empty')

	return false;
}