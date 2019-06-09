def conference_badges
  do

    let(:name) {"Arel"}
    let(:attendees) {["Edsger", "Ada", "Charles", "Alan", "Grace", "Linus", "Matz"]}
    let(:badges) {[
                    "Hello, my name is Edsger.",
                    "Hello, my name is Ada.",
                    "Hello, my name is Charles.",
                    "Hello, my name is Alan.",
                    "Hello, my name is Grace.",
                    "Hello, my name is Linus.",
                    "Hello, my name is Matz."
                 ]}

    let(:room_assignments) {[
                              "Hello, Edsger! You'll be assigned to room 1!",
                              "Hello, Ada! You'll be assigned to room 2!",
                              "Hello, Charles! You'll be assigned to room 3!",
                              "Hello, Alan! You'll be assigned to room 4!",
                              "Hello, Grace! You'll be assigned to room 5!",
                              "Hello, Linus! You'll be assigned to room 6!",
                              "Hello, Matz! You'll be assigned to room 7!"
                           ]}

    let(:badges_and_room_assignments) {<<-TEXT
  Hello, my name is Edsger.
  Hello, my name is Ada.
  Hello, my name is Charles.
  Hello, my name is Alan.
  Hello, my name is Grace.
  Hello, my name is Linus.
  Hello, my name is Matz.
  Hello, Edsger! You'll be assigned to room 1!
  Hello, Ada! You'll be assigned to room 2!
  Hello, Charles! You'll be assigned to room 3!
  Hello, Alan! You'll be assigned to room 4!
  Hello, Grace! You'll be assigned to room 5!
  Hello, Linus! You'll be assigned to room 6!
  Hello, Matz! You'll be assigned to room 7!
  TEXT
  }

    def badge_maker(name)
      puts "Hello, my name is #{name}."
      end

    describe '#batch_badge_creator' do

      # Question 2b

      it 'should return a list of badge messages' do
        expect(batch_badge_creator(attendees)).to eq(badges)
      end
      it 'should not hard-code response' do
        expect(batch_badge_creator(["Johnny"])).to eq(["Hello, my name is Johnny."])
      end

    end

    describe '#assign_rooms' do

      # Question 3

      it 'should return a list of welcome messages and room assignments' do
        expect(assign_rooms(attendees)).to eq(room_assignments)
      end
      it 'should not hard-code the response' do
        expect(assign_rooms(["Steve"])).to eq(["Hello, Steve! You'll be assigned to room 1!"])
      end

    end

    describe '#printer' do

      # Question 4
      # The method `printer` should output first the results of the batch_badge_creator method and then of the assign_rooms method to the screen - this way you can output
      # the badges and room assignments one at a time.
      # To make this test pass, make sure you are iterating through your badges and room assignments lists.

      it 'should puts the list of badges and room_assignments' do
        badges_and_room_assignments.each_line do |line|
          # $stdout is a Ruby global varibale that represents the current standard output.
          # In this case, the standard output is your terminal screen. This test, then,
          # is checking to see whether or not your terminal screen receives the correct
          # printed output.
          expect($stdout).to receive(:puts).with(line.chomp)
        end
        printer(attendees)
      end

    end

  end
