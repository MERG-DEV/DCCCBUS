set_test_name()

beginning_of_test(919)
    begin_test
      --
      set_paired_outputs_on
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_acc_pair(0, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair(0, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair(1, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(1, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(2, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 2, EN low)
      --
      input_dcc_basic_acc_pair(2, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 2, EN low)
      --
      input_dcc_basic_acc_pair(3, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 3, EN low)
      --
      input_dcc_basic_acc_pair(3, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 3, EN low)
      --
      input_dcc_basic_acc_pair(4, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 4, EN low)
      --
      input_dcc_basic_acc_pair(4, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 4, EN low)
      --
      input_dcc_basic_acc_pair(5, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 5, EN low)
      --
      input_dcc_basic_acc_pair(5, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 5, EN low)
      --
      input_dcc_basic_acc_pair(254, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 254, EN low)
      --
      input_dcc_basic_acc_pair(254, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 254, EN low)
      --
      input_dcc_basic_acc_pair(255, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 255, EN low)
      --
      input_dcc_basic_acc_pair(255, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 255, EN low)
      --
      input_dcc_basic_acc_pair(256, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(256), EN high,
                                                    low_byte(256), EN low)
      --
      input_dcc_basic_acc_pair(256, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(256), EN high,
                                                   low_byte(256), EN low)
      --
      input_dcc_basic_acc_pair(508, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(508), EN high,
                                                    low_byte(508), EN low)
      --
      input_dcc_basic_acc_pair(508, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(508), EN high,
                                                    low_byte(508), EN low)
      --
      log(Individual 510 Deactivation ignored)
      input_dcc_basic_acc(510, Deactivate)
      can_tx_check_for_no_message(1, DCC event)
      --
      log(Individual 510 Activation translated as pair 255 Deactivation)
      input_dcc_basic_acc(510, Activate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(255), EN high,
                                                    low_byte(255), EN low)
      --
      log(Individual 511 Deactivation ignored)
      input_dcc_basic_acc(511, Deactivate)
      can_tx_check_for_no_message(1, DCC event)
      --
      log(Individual 511 Activation translated as pair 255 Activation)
      input_dcc_basic_acc(511, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(255), EN high,
                                                    low_byte(255), EN low)
      --
      input_dcc_basic_acc_pair(1023, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1023), EN high,
                                                    low_byte(1023), EN low)
      --
      input_dcc_basic_acc_pair(1023, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1023), EN high,
                                                    low_byte(1023), EN low)
      --
      input_dcc_basic_acc_pair(1024, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1024), EN high,
                                                    low_byte(1024), EN low)
      --
      input_dcc_basic_acc_pair(1024, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1024), EN high,
                                                    low_byte(1024), EN low)
      --
      input_dcc_basic_acc_pair(1025, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1025), EN high,
                                                    low_byte(1025), EN low)
      --
      input_dcc_basic_acc_pair(1025, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1025), EN high,
                                                    low_byte(1025), EN low)
      --
      input_dcc_basic_acc_pair(2044, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2044), EN high,
                                                    low_byte(2044), EN low)
      --
      input_dcc_basic_acc_pair(2044, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2044), EN high,
                                                    low_byte(2044), EN low)
      --
      input_dcc_basic_acc_pair(2045, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2045), EN high,
                                                    low_byte(2045), EN low)
      --
      input_dcc_basic_acc_pair(2045, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2045), EN high,
                                                    low_byte(2045), EN low)
      --
      input_dcc_basic_acc_pair(2046, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2046), EN high,
                                                    low_byte(2046), EN low)
      --
      input_dcc_basic_acc_pair(2046, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2046), EN high,
                                                    low_byte(2046), EN low)
      --
      input_dcc_basic_acc_pair(2047, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2047), EN high,
                                                    low_byte(2047), EN low)
      --
      input_dcc_basic_acc_pair(2047, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2047), EN high,
                                                    low_byte(2047), EN low)
      --
end_of_test
