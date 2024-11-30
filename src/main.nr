use dep::std;

global TOTAL_CANDIDATES: u32 = 10;

global VOTER_COUNT: u32 = 2;

fn check_commitments(
    commitments: [Field; VOTER_COUNT],
    secrets: [Field; VOTER_COUNT],
    all_votes: [u32; VOTER_COUNT * TOTAL_CANDIDATES],
) {
    for i in 0..VOTER_COUNT {
        let mut transcript = [0; TOTAL_CANDIDATES + 1];
        transcript[0] = secrets[i];
        for j in 0..TOTAL_CANDIDATES {
            transcript[j + 1] = all_votes[i * TOTAL_CANDIDATES + j] as Field;
        }

        assert(commitments[i] == std::hash::pedersen_hash(transcript));
    }
}

fn sum_votes(all_votes: [u32; VOTER_COUNT * TOTAL_CANDIDATES]) -> [u32; TOTAL_CANDIDATES] {
    let mut totals = [0; TOTAL_CANDIDATES];
    for i in 0..VOTER_COUNT {
        for j in 0..TOTAL_CANDIDATES {
            totals[j] = totals[j] + all_votes[i * TOTAL_CANDIDATES + j];
        }
    }
    totals
}

fn main(
    commitments: pub [Field; VOTER_COUNT],
    all_votes: [u32; VOTER_COUNT * TOTAL_CANDIDATES],
    secrets: [Field; VOTER_COUNT],
) -> pub [u32; TOTAL_CANDIDATES] {
    check_commitments(commitments, secrets, all_votes);
    sum_votes(all_votes)
}
