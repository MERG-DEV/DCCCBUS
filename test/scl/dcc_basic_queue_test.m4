set_test_name()

beginning_of_test(587)
    begin_test
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_acc_pair(0, Deactivate)
      -- 1 in transmitter
      --
      input_dcc_basic_acc_pair(0, Activate)
      input_dcc_basic_acc_pair(1, Deactivate)
      input_dcc_basic_acc_pair(1, Activate)
      input_dcc_basic_acc_pair(251, Deactivate)
      input_dcc_basic_acc_pair(251, Activate)
      input_dcc_basic_acc_pair(252, Deactivate)
      input_dcc_basic_acc_pair(252, Activate)
      input_dcc_basic_acc_pair(507, Deactivate)
      input_dcc_basic_acc_pair(507, Activate)
      input_dcc_basic_acc_pair(508, Deactivate)
      input_dcc_basic_acc_pair(508, Activate)
      --
      -- 510 Deactivate not queued for Tx
      input_dcc_basic_acc(510, Deactivate)
      input_dcc_basic_acc(510, Activate)
      --
      -- 511 Deactivate not queued for Tx
      input_dcc_basic_acc(511, Deactivate)
      input_dcc_basic_acc(511, Activate)
      input_dcc_basic_acc_pair(1019, Deactivate)
      input_dcc_basic_acc_pair(1019, Activate)
      input_dcc_basic_acc_pair(1020, Deactivate)
      -- 1 in transmitter, 16 in Tx queue
      --
      input_dcc_basic_acc_pair(1020, Activate)
      input_dcc_basic_acc_pair(2042, Deactivate)
      input_dcc_basic_acc_pair(2042, Activate)
      input_dcc_basic_acc_pair(2043, Deactivate)
      input_dcc_basic_acc_pair(2043, Activate)
      input_dcc_basic_acc_pair(6, Activate)
      input_dcc_basic_acc_pair(7, Activate)
      input_dcc_basic_acc_pair(8, Activate)
      input_dcc_basic_acc_pair(9, Activate)
      input_dcc_basic_acc_pair(10, Activate)
      input_dcc_basic_acc_pair(11, Activate)
      input_dcc_basic_acc_pair(12, Activate)
      input_dcc_basic_acc_pair(13, Activate)
      input_dcc_basic_acc_pair(14, Activate)
      input_dcc_basic_acc_pair(15, Activate)
      input_dcc_basic_acc_pair(16, Activate)
      -- 1 in transmitter, 16 in Tx queue, 16 in DCC packet queue
      --
      input_dcc_basic_acc_pair(17, Activate)
      -- 1 in transmitter, 16 in Tx queue, 16 in rolled over DCC packet queue
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 1, EN low)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(251), EN high,
                                               low_byte(251), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(251), EN high,
                                               low_byte(251), EN low)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(252), EN high,
                                               low_byte(252), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(252), EN high,
                                               low_byte(252), EN low)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(507), EN high,
                                               low_byte(507), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(507), EN high,
                                               low_byte(507), EN low)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(508), EN high,
                                               low_byte(508), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(508), EN high,
                                               low_byte(508), EN low)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(255), EN high,
                                               low_byte(255), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(255), EN high,
                                               low_byte(255), EN low)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1019), EN high,
                                               low_byte(1019), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1019), EN high,
                                               low_byte(1019), EN low)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1020), EN high,
                                               low_byte(1020), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(17), EN high,
                                               low_byte(17), EN low)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2042), EN high,
                                               low_byte(2042), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2042), EN high,
                                               low_byte(2042), EN low)
      --
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2043), EN high,
                                               low_byte(2043), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2043), EN high,
                                               low_byte(2043), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(6), EN high,
                                               low_byte(6), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(7), EN high,
                                               low_byte(7), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(8), EN high,
                                               low_byte(8), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(9), EN high,
                                               low_byte(9), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(10), EN high,
                                               low_byte(10), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(10), EN high,
                                               low_byte(10), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(11), EN high,
                                               low_byte(11), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(12), EN high,
                                               low_byte(12), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(13), EN high,
                                               low_byte(13), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(14), EN high,
                                               low_byte(14), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(15), EN high,
                                               low_byte(15), EN low)
      --
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(16), EN high,
                                               low_byte(16), EN low)
      --
end_of_test
