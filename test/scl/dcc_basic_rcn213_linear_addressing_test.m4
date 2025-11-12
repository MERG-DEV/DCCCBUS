set_test_name()

beginning_of_test(538)
    begin_test
      --
      set_paired_outputs_off
      set_rcn213_linear_addressing_on
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_acc_pair(4, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(4, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(5, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 2, EN low)
      --
      input_dcc_basic_acc_pair(5, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 2, EN low)
      --
      input_dcc_basic_acc_pair(255, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(252), EN high,
                                               low_byte(252), EN low)
      --
      input_dcc_basic_acc_pair(255, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(252), EN high,
                                               low_byte(252), EN low)
      --
      input_dcc_basic_acc_pair(256, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(253), EN high,
                                               low_byte(253), EN low)
      --
      input_dcc_basic_acc_pair(256, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(253), EN high,
                                               low_byte(253), EN low)
      --
      input_dcc_basic_acc_pair(260, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(257), EN high,
                                               low_byte(257), EN low)
      --
      input_dcc_basic_acc_pair(260, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(257), EN high,
                                               low_byte(257), EN low)
      --
      input_dcc_basic_acc_pair(2046, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2043), EN high,
                                               low_byte(2043), EN low)
      --
      input_dcc_basic_acc_pair(2046, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2043), EN high,
                                               low_byte(2043), EN low)
      --
      input_dcc_basic_acc_pair(2047, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2044), EN high,
                                               low_byte(2044), EN low)
      --
      input_dcc_basic_acc_pair(2047, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2044), EN high,
                                               low_byte(2044), EN low)
      --
      input_dcc_basic_acc_pair(0, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2045), EN high,
                                               low_byte(2045), EN low)
      --
      input_dcc_basic_acc_pair(0, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2045), EN high,
                                               low_byte(2045), EN low)
      --
      input_dcc_basic_acc_pair(1, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2046), EN high,
                                               low_byte(2046), EN low)
      --
      input_dcc_basic_acc_pair(1, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2046), EN high,
                                               low_byte(2046), EN low)
      --
      input_dcc_basic_acc_pair(2, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2047), EN high,
                                               low_byte(2047), EN low)
      --
      input_dcc_basic_acc_pair(2, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2047), EN high,
                                               low_byte(2047), EN low)
      --
      input_dcc_basic_acc_pair(3, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2048), EN high,
                                               low_byte(2048), EN low)
      --
      input_dcc_basic_acc_pair(3, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2048), EN high,
                                               low_byte(2048), EN low)
      --
end_of_test
