set_test_name()

beginning_of_test(891)
    begin_test
      --
      set_paired_outputs_off
      set_rcn213_linear_addressing_off
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_acc(0, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc(0, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc(1, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc(1, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc(502, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(502), EN high,
                                               low_byte(502), EN low)
      --
      input_dcc_basic_acc(502, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(502), EN high,
                                               low_byte(502), EN low)
      --
      input_dcc_basic_acc(503, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(503), EN high,
                                               low_byte(503), EN low)
      --
      input_dcc_basic_acc(503, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(503), EN high,
                                               low_byte(503), EN low)
      --
      input_dcc_basic_acc(1014, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1014), EN high,
                                               low_byte(1014), EN low)
      --
      input_dcc_basic_acc(1014, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1014), EN high,
                                               low_byte(1014), EN low)
      --
      input_dcc_basic_acc(1013, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1013), EN high,
                                               low_byte(1013), EN low)
      --
      input_dcc_basic_acc(1013, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1013), EN high,
                                               low_byte(1013), EN low)
      --
      log(Pair 510 Deactivation translated as individual 1020 Activation)
      input_dcc_basic_acc_pair(510, Deactivate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1020), EN high,
                                               low_byte(1020), EN low)
      --
      log(Pair 510 Activation translated as individual 1021 Activation)
      input_dcc_basic_acc_pair(510, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1021), EN high,
                                               low_byte(1021), EN low)
      --
      log(Pair 511 Deactivation translated as individual 1022 Activation)
      input_dcc_basic_acc_pair(511, Deactivate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1022), EN high,
                                               low_byte(1022), EN low)
      --
      log(Pair 511 Activation translated as individual 1023 Activation)
      input_dcc_basic_acc_pair(511, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1023), EN high,
                                               low_byte(1023), EN low)
      --
      input_dcc_basic_acc(2038, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2038), EN high,
                                               low_byte(2038), EN low)
      --
      input_dcc_basic_acc(2038, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2038), EN high,
                                               low_byte(2038), EN low)
      --
      input_dcc_basic_acc(2040, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2040), EN high,
                                               low_byte(2040), EN low)
      --
      input_dcc_basic_acc(2040, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2040), EN high,
                                               low_byte(2040), EN low)
      --
      input_dcc_basic_acc(4084, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(4084), EN high,
                                               low_byte(4084), EN low)
      --
      input_dcc_basic_acc(4084, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(4084), EN high,
                                               low_byte(4084), EN low)
      --
      input_dcc_basic_acc(4086, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(4086), EN high,
                                               low_byte(4086), EN low)
      --
      input_dcc_basic_acc(4087, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(4087), EN high,
                                               low_byte(4087), EN low)
      --
      input_dcc_basic_acc(6, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(6), EN high,
                                               low_byte(6), EN low)
      --
      input_dcc_basic_acc(7, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(7), EN high,
                                               low_byte(7), EN low)
      --
      input_dcc_basic_acc(8, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(8), EN high,
                                               low_byte(8), EN low)
      --
      input_dcc_basic_acc(9, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(9), EN high,
                                               low_byte(9), EN low)
      --
      input_dcc_basic_acc(10, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(10), EN high,
                                               low_byte(10), EN low)
      --
      input_dcc_basic_acc(11, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(11), EN high,
                                               low_byte(11), EN low)
      --
      input_dcc_basic_acc(12, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(12), EN high,
                                               low_byte(12), EN low)
      --
      input_dcc_basic_acc(13, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(13), EN high,
                                               low_byte(13), EN low)
      --
      input_dcc_basic_acc(14, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(14), EN high,
                                               low_byte(14), EN low)
      --
      input_dcc_basic_acc(15, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(15), EN high,
                                               low_byte(15), EN low)
      --
      input_dcc_basic_acc(16, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(16), EN high,
                                               low_byte(16), EN low)
      --
      input_dcc_basic_acc(17, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(17), EN high,
                                               low_byte(17), EN low)
      --
      input_dcc_basic_acc(18, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(18), EN high,
                                               low_byte(18), EN low)
      --
end_of_test
