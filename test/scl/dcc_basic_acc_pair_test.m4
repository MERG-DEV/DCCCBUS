set_test_name()

beginning_of_test(895)
    begin_test
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_acc_pair(0, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair(0, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair(1, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(1, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(251, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(251), EN high,
                                               low_byte(251), EN low)
      --
      input_dcc_basic_acc_pair(251, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(251), EN high,
                                               low_byte(251), EN low)
      --
      input_dcc_basic_acc_pair(252, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(252), EN high,
                                               low_byte(252), EN low)
      --
      input_dcc_basic_acc_pair(252, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(252), EN high,
                                               low_byte(252), EN low)
      --
      input_dcc_basic_acc_pair(507, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(507), EN high,
                                               low_byte(507), EN low)
      --
      input_dcc_basic_acc_pair(507, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(507), EN high,
                                               low_byte(507), EN low)
      --
      input_dcc_basic_acc_pair(508, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(508), EN high,
                                               low_byte(508), EN low)
      --
      input_dcc_basic_acc_pair(508, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(508), EN high,
                                               low_byte(508), EN low)
      --
      input_dcc_basic_acc(510, Deactivate)
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc(510, Activate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(255), EN high,
                                               low_byte(255), EN low)
      --
      input_dcc_basic_acc(511, Deactivate)
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc(511, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(255), EN high,
                                               low_byte(255), EN low)
      --
      log(DCC packet queue wrapped)
      --
      input_dcc_basic_acc_pair(1019, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1019), EN high,
                                               low_byte(1019), EN low)
      --
      input_dcc_basic_acc_pair(1019, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1019), EN high,
                                               low_byte(1019), EN low)
      --
      log(Event Tx queue wrapped)
      --
      input_dcc_basic_acc_pair(1020, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1020), EN high,
                                               low_byte(1020), EN low)
      --
      input_dcc_basic_acc_pair(1020, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1020), EN high,
                                               low_byte(1020), EN low)
      --
      input_dcc_basic_acc_pair(2042, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2042), EN high,
                                               low_byte(2042), EN low)
      --
      input_dcc_basic_acc_pair(2042, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2042), EN high,
                                               low_byte(2042), EN low)
      --
      input_dcc_basic_acc_pair(2043, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2043), EN high,
                                               low_byte(2043), EN low)
      --
      input_dcc_basic_acc_pair(2043, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2043), EN high,
                                               low_byte(2043), EN low)
      --
      input_dcc_basic_acc_pair(6, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(6), EN high,
                                               low_byte(6), EN low)
      --
      input_dcc_basic_acc_pair(7, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(7), EN high,
                                               low_byte(7), EN low)
      --
      input_dcc_basic_acc_pair(8, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(8), EN high,
                                               low_byte(8), EN low)
      --
      input_dcc_basic_acc_pair(9, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(9), EN high,
                                               low_byte(9), EN low)
      --
      input_dcc_basic_acc_pair(10, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(10), EN high,
                                               low_byte(10), EN low)
      --
      input_dcc_basic_acc_pair(11, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(11), EN high,
                                               low_byte(11), EN low)
      --
      input_dcc_basic_acc_pair(12, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(12), EN high,
                                               low_byte(12), EN low)
      --
      input_dcc_basic_acc_pair(13, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(13), EN high,
                                               low_byte(13), EN low)
      --
      log(DCC packet queue wrapped)
      --
      input_dcc_basic_acc_pair(14, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(14), EN high,
                                               low_byte(14), EN low)
      --
      input_dcc_basic_acc_pair(15, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(15), EN high,
                                               low_byte(15), EN low)
      --
      log(Event Tx queue wrapped)
      --
      input_dcc_basic_acc_pair(16, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(16), EN high,
                                               low_byte(16), EN low)
      --
      input_dcc_basic_acc_pair(17, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(17), EN high,
                                               low_byte(17), EN low)
      --
      input_dcc_basic_acc_pair(18, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(18), EN high,
                                               low_byte(18), EN low)
      --
end_of_test
