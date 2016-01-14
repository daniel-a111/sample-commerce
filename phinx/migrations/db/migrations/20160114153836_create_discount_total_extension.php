<?php

use Phinx\Migration\AbstractMigration;

class CreateDiscountTotalExtension extends AbstractMigration
{
    /**
     * Change Method.
     *
     * Write your reversible migrations using this method.
     *
     * More information on writing migrations is available here:
     * http://docs.phinx.org/en/latest/migrations.html#the-abstractmigration-class
     *
     * The following commands can be used in this method and Phinx will
     * automatically reverse them when rolling back:
     *
     *    createTable
     *    renameTable
     *    addColumn
     *    renameColumn
     *    addIndex
     *    addForeignKey
     *
     * Remember to call "create()" or "update()" and NOT "save()" when working
     * with the Table class.
     */
    public function up()
    {
        $table_oc_extension = $this->table('oc_extension');
        $table_oc_setting = $this->table('oc_setting');

        $row = $this->fetchAll('SELECT COUNT(*) as total FROM oc_extension WHERE type = "total" AND code="discount"');
        if($row[0]['total'] == 0)
        {
            $data = [
                'type'  => 'total',
                'code'  => 'discount'
            ];

            $table_oc_extension->insert($data);
            $table_oc_extension->saveData();

            unset($data);
            unset($row);

        }

        $data = [];
        $row = $this->fetchAll('SELECT COUNT(*) as discount_status FROM oc_setting WHERE code = "discount" and `key` = "discount_status"');
        if($row[0]['discount_status'] == 0) {
            $data[] = [
                    'code' => 'discount',
                    'key' => 'discount_status',
                    'value' => '0'
                ];
            }

        $row = $this->fetchAll('SELECT COUNT(*) as discount_sort_order FROM oc_setting WHERE code = "discount" and `key` = "discount_sort_order"');
        if($row[0]['discount_sort_order'] == 0) {
            $data[] = [
                    'code' => 'discount',
                    'key' => 'discount_sort_order',
                    'value' => '10'
                ];
        }

        $row = $this->fetchAll('SELECT COUNT(*) as discount_amount FROM oc_setting WHERE code = "discount" and `key` = "discount_amount"');
        if($row[0]['discount_amount'] == 0) {
            $data[] = [
                    'code' => 'discount',
                    'key' => 'discount_amount',
                    'value' => '5'
                ];
        }

        if(isset($data))
        {
            $table_oc_setting->insert($data);
            $table_oc_setting->saveData();
        }

        unset($data);
        unset($row);
    }

    public function down()
    {
        $this->execute('DELETE FROM oc_extension WHERE type = "total" AND code="discount"');
        $this->execute('DELETE FROM oc_setting WHERE code = "discount"');
    }
}
