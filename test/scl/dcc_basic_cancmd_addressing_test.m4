set_test_name()

beginning_of_test(883)
    begin_test
      --
      set_cancmd_addressing_on
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_acc_pair(0, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2044), EN high,
                                                    low_byte(2044), EN low)
      --
      input_dcc_basic_acc_pair(0, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2044), EN high,
                                                    low_byte(2044), EN low)
      --
      input_dcc_basic_acc_pair(1, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2045), EN high,
                                                    low_byte(2045), EN low)
      --
      input_dcc_basic_acc_pair(1, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2045), EN high,
                                                    low_byte(2045), EN low)
      --
      input_dcc_basic_acc_pair(2, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2046), EN high,
                                                    low_byte(2046), EN low)
      --
      input_dcc_basic_acc_pair(2, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2046), EN high,
                                                    low_byte(2046), EN low)
      --
      input_dcc_basic_acc_pair(3, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2047), EN high,
                                                    low_byte(2047), EN low)
      --
      input_dcc_basic_acc_pair(3, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2047), EN high,
                                                    low_byte(2047), EN low)
      --
      input_dcc_basic_acc_pair(4, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair(4, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair(5, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(5, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(258, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 254, EN low)
      --
      input_dcc_basic_acc_pair(258, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 254, EN low)
      --
      input_dcc_basic_acc_pair(259, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 255, EN low)
      --
      input_dcc_basic_acc_pair(259, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 255, EN low)
      --
      input_dcc_basic_acc_pair(260, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(256), EN high,
                                                    low_byte(256), EN low)
      --
      input_dcc_basic_acc_pair(260, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(256), EN high,
                                                    low_byte(256), EN low)
      --
      log(Individual 518 Deactivation ignored)
      input_dcc_basic_acc(518, Deactivate)
      can_tx_check_for_no_message(1, DCC event)
      --
      log(Individual 518 Activation translated as pair 255 Deactivation)
      input_dcc_basic_acc(518, Activate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(255), EN high,
                                                    low_byte(255), EN low)
      --
      log(Individual 519 Deactivation ignored)
      input_dcc_basic_acc(519, Deactivate)
      can_tx_check_for_no_message(1, DCC event)
      --
      log(Individual 519 Activation translated as pair 255 Activation)
      input_dcc_basic_acc(519, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(255), EN high,
                                                    low_byte(255), EN low)
      --
      input_dcc_basic_acc_pair(1027, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1023), EN high,
                                                    low_byte(1023), EN low)
      --
      input_dcc_basic_acc_pair(1027, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1023), EN high,
                                                    low_byte(1023), EN low)
      --
      input_dcc_basic_acc_pair(1028, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1024), EN high,
                                                    low_byte(1024), EN low)
      --
      input_dcc_basic_acc_pair(1028, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1024), EN high,
                                                    low_byte(1024), EN low)
      --
      input_dcc_basic_acc_pair(1029, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1025), EN high,
                                                    low_byte(1025), EN low)
      --
      input_dcc_basic_acc_pair(1029, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1025), EN high,
                                                    low_byte(1025), EN low)
      --
      input_dcc_basic_acc_pair(2044, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2040), EN high,
                                                    low_byte(2040), EN low)
      --
      input_dcc_basic_acc_pair(2044, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2040), EN high,
                                                    low_byte(2040), EN low)
      --
      input_dcc_basic_acc_pair(2045, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2041), EN high,
                                                    low_byte(2041), EN low)
      --
      input_dcc_basic_acc_pair(2045, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2041), EN high,
                                                    low_byte(2041), EN low)
      --
      input_dcc_basic_acc_pair(2046, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2042), EN high,
                                                    low_byte(2042), EN low)
      --
      input_dcc_basic_acc_pair(2046, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2042), EN high,
                                                    low_byte(2042), EN low)
      --
      input_dcc_basic_acc_pair(2047, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2043), EN high,
                                                    low_byte(2043), EN low)
      --
      input_dcc_basic_acc_pair(2047, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2043), EN high,
                                                    low_byte(2043), EN low)
      --
end_of_test
