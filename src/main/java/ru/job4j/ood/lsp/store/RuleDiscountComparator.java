package ru.job4j.ood.lsp.store;

import java.util.Comparator;

public class RuleDiscountComparator implements Comparator<DiscountRule> {
        @Override
        public int compare(DiscountRule r1, DiscountRule r2) {
            return r1.getDiscount() - r2.getDiscount();
        }
}

