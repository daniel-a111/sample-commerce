<?php
class ModelTotalDiscount extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		$this->load->language('total/discount');

		$total_data[] = array(
			'code'       => 'discount',
			'title'      => $this->language->get('text_discount'),
			'value'      => -((float)$this->config->get('discount_amount')),
			'sort_order' => $this->config->get('discount_sort_order')
		);

		$total -= $this->config->get('discount_amount');
	}
}