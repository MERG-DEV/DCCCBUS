set_test_name()

beginning_of_test(881)
    begin_test
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_acc_pair(1, Deactivate)
      log(1 in transmitter)
      --
      input_dcc_basic_acc_pair(2, Activate)
      input_dcc_basic_acc_pair(3, Deactivate)
      input_dcc_basic_acc_pair(4, Activate)
      input_dcc_basic_acc_pair(5, Deactivate)
      input_dcc_basic_acc_pair(6, Activate)
      input_dcc_basic_acc_pair(7, Deactivate)
      input_dcc_basic_acc_pair(8, Activate)
      input_dcc_basic_acc_pair(9, Deactivate)
      input_dcc_basic_acc_pair(10, Activate)
      input_dcc_basic_acc_pair(11, Deactivate)
      input_dcc_basic_acc_pair(12, Activate)
      --
      log(13 Deactivate not queued for Tx)
      input_dcc_basic_acc(13, Deactivate)
      --
      input_dcc_basic_acc(14, Activate)
      --
      log(15 Deactivate not queued for Tx)
      input_dcc_basic_acc(15, Deactivate)
      --
      input_dcc_basic_acc(16, Activate)
      log(DCC packet queue insert and extract wrapped)
      --
      input_dcc_basic_acc_pair(101, Deactivate)
      input_dcc_basic_acc_pair(102, Activate)
      log(Event Tx queue insert wrapped)
      --
      input_dcc_basic_acc_pair(103, Deactivate)
      log(1 in transmitter 16 in Event Tx queue)
      --
      input_dcc_basic_acc_pair(104, Activate)
      input_dcc_basic_acc_pair(105, Deactivate)
      input_dcc_basic_acc_pair(106, Activate)
      input_dcc_basic_acc_pair(107, Deactivate)
      input_dcc_basic_acc_pair(108, Activate)
      input_dcc_basic_acc_pair(109, Activate)
      input_dcc_basic_acc_pair(110, Activate)
      input_dcc_basic_acc_pair(111, Activate)
      input_dcc_basic_acc_pair(112, Activate)
      input_dcc_basic_acc_pair(113, Activate)
      input_dcc_basic_acc_pair(114, Activate)
      input_dcc_basic_acc_pair(115, Activate)
      input_dcc_basic_acc_pair(116, Activate)
      log(DCC packet queue insert wrapped)
      --
      input_dcc_basic_acc_pair(117, Activate)
      input_dcc_basic_acc_pair(118, Activate)
      input_dcc_basic_acc_pair(119, Activate)
      log(1 in transmitter 16 in Event Tx queue 16 in DCC packet queue)
      --
      log(DCC packet queue 104 overwritten by 204)
      input_dcc_basic_acc_pair(204, Deactivate)
      --
      log(DCC packet queue 105 overwritten by 205)
      input_dcc_basic_acc_pair(205, Activate)
      log(1 in transmitter 16 in Event Tx queue 16 in DCC packet queue)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high,   1, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high,   2, EN low)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high,   3, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high,   4, EN low)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high,   5, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high,   6, EN low)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high,   7, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high,   8, EN low)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high,   9, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high,  10, EN low)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high,  11, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high,  12, EN low)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high,   7, EN low)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high,   8, EN low)
      log(DCC packet queue extract wrapped)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 101, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 102, EN low)
      log(Event Tx queue insert and extract wrapped)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 103, EN low)
      log(DCC packet queue cleared)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 204, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 205, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 106, EN low)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 107, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 108, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 109, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 110, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 111, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 112, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 113, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 114, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 115, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 116, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 117, EN low)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 118, EN low)
      log(Event Tx queue extract wrapped)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 119, EN low)
      log(Event Tx queue cleared)
      --
      tx_check_for_no_message(1, DCC event)
      --
end_of_test
