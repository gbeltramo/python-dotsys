#!/usr/bin/env p
import argparse

def parse_arguments() -> dict:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--TAN",
        type=float,
        required=True,
        help="TAN in range [0, 100], will be dived by 100.0 by this program",
    )
    parser.add_argument(
        "--TAEG",
        type=float,
        required=True,
        help="TAEG in range [0, 100], will be divied by 100.0 by this program",
    )
    parser.add_argument("--num_years", type=int, required=True, help="Number of years")
    parser.add_argument("--taken", type=int, required=True, help="Money you take")
    arguments = parser.parse_args()

    args = {
           "TAN": arguments.TAN,
           "TAEG": arguments.TAEG,
           "num_years": arguments.num_years,
           "taken": arguments.taken,
        }
    
    return args


def main(args: dict) -> None:
    args = parse_arguments()

    results = {"TAN": dict(), "TAEG": dict()}
    for rate in results.keys():
        r = args[rate] / 12.0 / 100.0
        n = args["num_years"] * 12
        monthly_fee = round(args["taken"] * (r * (1 + r) ** n) / ((1 + r) ** n - 1), 2)
        total = round(monthly_fee * n, 2)
        results[rate] = {"total": total, "cost": round(total - args["taken"], 2)}

        # Results to STDOUT
        print("-" * 30)
        print(f"Calculation with {rate} of {args[rate]}")
        print(f"\t- Money you take: {args['taken']}")
        print("\t- Monthly fee:", round(monthly_fee, 2))
        print("\t- Total you give back:", f"{results[rate]['total']}")
        print("\t- Cost:", f"{results[rate]['cost']}")


if __name__ == "__main__":
    args = parse_arguments()
    print("Arguments:", args)
    main(args=args)
