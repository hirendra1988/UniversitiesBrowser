import Testing
@testable import CommonUI

struct CommonUITests {

    @Test
    func appSpacingValuesAreCorrect() {
        #expect(AppSpacing.small == 8)
        #expect(AppSpacing.medium == 16)
        #expect(AppSpacing.large == 24)
    }

    @Test
    func appColorsCanBeAccessed() {
        _ = AppColors.primary
        _ = AppColors.secondaryText
        _ = AppColors.background
        _ = AppColors.cardBackground
        _ = AppColors.error

        #expect(Bool(true))
    }
}
