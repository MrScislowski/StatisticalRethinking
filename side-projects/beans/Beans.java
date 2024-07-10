public class Beans {
    private static int LADLE_SIZE = 5;
    private static int BEAN_TYPE_COUNT = 3;

    private static boolean[] beanTypeUsed = new boolean[BEAN_TYPE_COUNT];

    public static boolean missingBeans() {
        int usedTypes = 0;
        for (int i = 0; i < BEAN_TYPE_COUNT; i++) {
            beanTypeUsed[i] = false;
        }

        for (int i = 0; i < LADLE_SIZE; i++) {
            int r = (int) (Math.random() * BEAN_TYPE_COUNT);
            if (beanTypeUsed[r]) {
                continue;
            } else {
                beanTypeUsed[r] = true;
                usedTypes++;
                if (usedTypes == BEAN_TYPE_COUNT) {
                    return false;
                }
            }
        }
        return true;
    }

    public static void main(String[] args) {
        int trialCount = 10000;
        int missingCount = 0;
        for (int i = 0; i < trialCount; i++) {
            if (missingBeans()) {
                missingCount++;
            }
        }
        System.out.println(1.0 * missingCount / trialCount * 100);
    }
}
