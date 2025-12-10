set_test_name()

beginning_of_test(61)
    --
    variable can_tx_count  : integer;
    --
    begin_test
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_extnd_acc(0, 42)
      input_dcc_basic_acc(1013, Activate)
      --
      can_tx_wait_if_not_ready
      can_tx_check_can_id(original, 2#10000000#, 2#00100000#)
      --
      can_tx_count := 12;
      while can_tx_count > 0 loop
        can_tx_transmission_error_interrupt
        can_tx_count := can_tx_count - 1;
      end loop;
      --
      can_tx_check_can_id(unchanged, 2#10000000#, 2#00100000#)
      --
      can_tx_count := 5;
      while can_tx_count > 0 loop
        can_tx_arbitration_lost_interrupt
        can_tx_count := can_tx_count - 1;
      end loop;
      --
      can_tx_count := 6;
      while can_tx_count > 0 loop
        can_tx_transmission_error_interrupt
        can_tx_count := can_tx_count - 1;
      end loop;
      --
      can_tx_check_can_id(still unchanged, 2#10000000#, 2#00100000#)
      --
      can_tx_count := 5;
      while can_tx_count > 0 loop
        can_tx_arbitration_lost_interrupt
        can_tx_count := can_tx_count - 1;
      end loop;
      --
      can_tx_check_can_id(still unchanged, 2#10000000#, 2#00100000#)
      --
      can_tx_arbitration_lost_interrupt
      can_tx_check_can_id(raised priority, 2#01000000#, 2#00100000#)
      --
      can_tx_count := 5;
      while can_tx_count > 0 loop
        can_tx_arbitration_lost_interrupt
        can_tx_count := can_tx_count - 1;
      end loop;
      --
      can_tx_count := 6;
      while can_tx_count > 0 loop
        can_tx_transmission_error_interrupt
        can_tx_count := can_tx_count - 1;
      end loop;
      --
      can_tx_check_can_id(still high priority, 2#01000000#, 2#00100000#)
      --
      can_tx_count := 4;
      while can_tx_count > 0 loop
        can_tx_arbitration_lost_interrupt
        can_tx_count := can_tx_count - 1;
      end loop;
      --
      can_tx_check_can_id(still high priority, 2#01000000#, 2#00100000#)
      --
      can_tx_arbitration_lost_interrupt
      can_tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high, 0, EN low, 42, Data)
      can_tx_check_can_id(top priority, 2#00000000#, 2#00100000#)
      --
      can_tx_count := 12;
      while can_tx_count > 0 loop
        can_tx_transmission_error_interrupt
        can_tx_count := can_tx_count - 1;
      end loop;
      --
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1013), EN high,
                                               low_byte(1013), EN low)
      can_tx_check_can_id(back to original, 2#10000000#, 2#00100000#)
      --
end_of_test
