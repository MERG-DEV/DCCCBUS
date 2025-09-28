set_test_name()

beginning_of_test(489)
    begin_test
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_acc_pair(0, Off)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair(0, On)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair(1, Off)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(1, On)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(251, Off)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(251), EN high, low_byte(251), EN low)
      --
      input_dcc_basic_acc_pair(251, On)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(251), EN high, low_byte(251), EN low)
      --
      input_dcc_basic_acc_pair(252, Off)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(252), EN high, low_byte(252), EN low)
      --
      input_dcc_basic_acc_pair(252, On)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(252), EN high, low_byte(252), EN low)
      --
      input_dcc_basic_acc_pair(507, Off)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(507), EN high, low_byte(507), EN low)
      --
      input_dcc_basic_acc_pair(507, On)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(507), EN high, low_byte(507), EN low)
      --
      input_dcc_basic_acc_pair(508, Off)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(508), EN high, low_byte(508), EN low)
      --
      input_dcc_basic_acc_pair(508, On)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(508), EN high, low_byte(508), EN low)
      --
      input_dcc_basic_acc_pair(1019, Off)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1019), EN high, low_byte(1019), EN low)
      --
      input_dcc_basic_acc_pair(1019, On)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1019), EN high, low_byte(1019), EN low)
      --
      input_dcc_basic_acc_pair(1020, Off)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1020), EN high, low_byte(1020), EN low)
      --
      input_dcc_basic_acc_pair(1020, On)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1020), EN high, low_byte(1020), EN low)
      --
      input_dcc_basic_acc_pair(2042, Off)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2042), EN high, low_byte(2042), EN low)
      --
      input_dcc_basic_acc_pair(2042, On)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2042), EN high, low_byte(2042), EN low)
      --
      input_dcc_basic_acc_pair(2043, Off)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2043), EN high, low_byte(2043), EN low)
      --
      input_dcc_basic_acc_pair(2043, On)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2043), EN high, low_byte(2043), EN low)
      --
end_of_test
